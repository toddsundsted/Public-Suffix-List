$:.unshift(File.dirname(__FILE__)) unless $:.include?(File.dirname(__FILE__))

require 'open-uri'
require "public_suffix_list/parser.rb"

class PublicSuffixList

  VERSION = "0.0.1"

  def self.config
    @@config ||= Config.new
  end

  def self.configure(&block)
    yield config
  end
  
  class Config

    attr_accessor :effective_tld_names_url

    def initialize
      @effective_tld_names_url = "http://mxr.mozilla.org/mozilla-central/source/netwerk/dns/src/effective_tld_names.dat?raw=1"
    end

  end

  def initialize(url = self.class.config.effective_tld_names_url)
    @rules = Parser.parse(open(url))
  end

  def split(domain)
    domain = domain.split(".")
    result = best(match(domain.dup, @rules))
    [domain.dup.reverse.drop(result.size + 1).reverse.join("."), domain.dup.reverse.drop(result.size).first, result.reverse.join('.')]
  end

  def tld(domain)
    best(match(domain.split("."), @rules)).reverse.join(".")
  end

  private

  def match(domain, rules)
    return [] if domain.empty? or rules.empty?
    set = []
    first = domain.pop
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

end
