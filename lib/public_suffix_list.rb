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
    Parser.parse(open(url))
  end

end
