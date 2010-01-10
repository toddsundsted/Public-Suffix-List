$:.unshift(File.dirname(__FILE__)) unless $:.include?(File.dirname(__FILE__))

require 'open-uri'
require "public_suffix_list/parser.rb"

class PublicSuffixList

  VERSION = "0.0.2"

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

  def initialize(options = {})
    @config = self.class.config.dup
    options.each { |k, v| @config.send("#{k}=", v) }
    if @config.cache_dir && File.directory?(@config.cache_dir) && File.exist?(File.join(@config.cache_dir, name))
      uncache or (download and cache)
    elsif @config.cache_dir && File.directory?(@config.cache_dir)
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
    @cache = {:rules => @rules, :created_at => Time.now}
    open(File.join(@config.cache_dir, name), "w") { |f| Marshal.dump(@cache, f) }
  end

  def uncache
    open(File.join(@config.cache_dir, name), "r") { |f| @cache = Marshal.load(f) }
    @rules = @cache[:rules] if Time.now < @cache[:created_at] + @config.cache_expiry_period
  end

  def download
    @rules = Parser.parse(open(@config.effective_tld_names_url))
  end

  def match(domain, rules)
    return [] if domain.empty? or rules.empty?
    domain = domain.dup
    first = domain.pop
    set = []
    [[first, first], ["!#{first}", "!#{first}"], ["*", first]].each do |a, b|
      if rules[a]
        set << [b]
        match(domain, rules[a]).each { |result| set << [first] + result }
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
