Gem::Specification.new do |s|

  s.name = %q{public-suffix-list}
  s.summary = <<-SUMMARY.strip.gsub(/\n\s+/, " ")
    Public Suffix List is a small Ruby library designed to make the
    Public Suffix List (http://publicsuffix.org/) easier to use.
  SUMMARY
  s.description = <<-DESCRIPTION.strip.gsub(/\n\s+/, " ")
    The Public Suffix List (http://publicsuffix.org/) is "a
    cross-vendor initiative to provide an accurate list of domain name
    suffixes". Such a list is necessary because "there was and remains
    no algorithmic method of finding the highest level at which a
    domain may be registered for a particular top-level domain (the
    policies differ with each registry)...". Public Suffix List is
    also a small Ruby library designed to make the Public Suffix List
    (http://publicsuffix.org/) easier to use.
  DESCRIPTION
  s.homepage = %q{http://github.com/toddsundsted/Public-Suffix-List}
  s.authors = ["Todd Sundsted"]
  s.version = "0.1.0"
  s.rubygems_version = %q{1.3.5}
  s.require_paths = ["lib"]
  s.files = [
    "README.rdoc",
    "lib/public_suffix_list.rb",
    "lib/public_suffix_list/parser.rb",
    "lib/public_suffix_list/cache_file.rb",
    "spec/caching.spec",
    "spec/cookie_calculation.spec",
    "spec/public_suffix_list.spec",
    "spec/test.dat"
    ]
  s.has_rdoc = true

end
