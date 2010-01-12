$:.unshift(File.dirname(__FILE__)) unless $:.include?(File.dirname(__FILE__))

require 'open-uri'
require "public_suffix_list/cache_file.rb"
require "public_suffix_list/parser.rb"

class PublicSuffixList

  VERSION = "0.0.5"

  def self.config
    @@config ||= Config.new
  end

  def self.configure(&block)
    yield config
  end
  
  class Config

    attr_accessor :cache_dir
    attr_accessor :cache_expiry_period
    attr_accessor :effective_tld_names_url

    def initialize
      @cache_dir = nil
      @cache_expiry_period = 30 * 24 * 60 * 60
      @effective_tld_names_url = "http://mxr.mozilla.org/mozilla-central/source/netwerk/dns/src/effective_tld_names.dat?raw=1"
    end

  end

  attr_reader :config, :cache_file

  def initialize(options = {})
    @config = self.class.config.dup
    options.each { |k, v| @config.send("#{k}=", v) }
    if @config.cache_dir
      @cache_file = CacheFile.new(@config)
    end
    if @cache_file and @cache_file.exist?
      uncache or (download and cache)
    elsif @cache_file
      download and cache
    else
      download
    end
  end

  def split(domain)
    domain = domain.split(".")
    result = best(match(domain, @rules))
    [gimme!(domain, result.size), gimme!(domain), domain].reverse.map { |d| d ? d.join(".") : "" }
  end

  def tld(domain)
    domain = domain.split(".")
    result = best(match(domain, @rules))
    gimme!(domain, result.size).join(".")
  end

  def cdn(domain)
    domain = domain.split(".")
    result = best(match(domain, @rules))
    gimme!(domain, result.size + 1).join(".")
  end

  private

  def name
    URI.parse(@config.effective_tld_names_url).path.split("/").last + ".cache"
  end

  def cache
    @cache = {:rules => @rules, :created_at => Time.now, :tag => rand(36**8).to_s(36)}
    open(File.join(@config.cache_dir, name), "w") { |f| Marshal.dump(@cache, f) }
  end

  def uncache
    open(File.join(@config.cache_dir, name), "r") { |f| @cache = Marshal.load(f) }
    @rules = @cache[:rules] unless expired?
  end

  def expired?
    !(@config.cache_expiry_period.nil? or @config.cache_expiry_period == 0 or Time.now < @cache[:created_at] + @config.cache_expiry_period)
  end

  def download
    @rules = Parser.parse(open(@config.effective_tld_names_url))
  end

  def match(domain, rules)
    return [] if domain.empty? or rules.empty?
    domain = domain.dup
    first = domain.pop
    set = []
    [[first, first], ["!#{first}", "!#{first}"], ["*", first]].each do |pattern, name|
      if rules[pattern]
        set << [name] if rules[pattern][:term]
        match(domain, rules[pattern]).each { |result| set << [first] + result }
      end
    end
    set
  end

  def best(results)
    return [] if results.empty?
    result = results.find { |r| r.last[0] == ?! } || results.sort { |a, b| a.size <=> b.size }.last
    result = result[0..result.size - 2] if result.last[0] == ?!
    result
  end

  def gimme!(domain, n = 1)
    domain.slice!(-n, n) || []
  end

end
