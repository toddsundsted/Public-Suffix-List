# typed: true
require 'public_suffix_list'

def cookie_calculation(public_suffix_list, domain)
  s, d, t = public_suffix_list.split(domain)
  s.empty? && !d.empty? ? "Cookies may be set for #{domain}." : "Cookies may not be set for #{domain}."
end

describe PublicSuffixList do

  it "should calculate cookies as described at http://publicsuffix.org/format/" do
    public_suffix_list = PublicSuffixList.new(:url => "spec/test.dat")
    cookie_calculation(public_suffix_list, "foo.com").should == "Cookies may be set for foo.com."
    cookie_calculation(public_suffix_list, "foo.bar.jp").should == "Cookies may be set for foo.bar.jp."
    cookie_calculation(public_suffix_list, "bar.jp").should == "Cookies may not be set for bar.jp."
    cookie_calculation(public_suffix_list, "foo.bar.hokkaido.jp").should == "Cookies may be set for foo.bar.hokkaido.jp."
    cookie_calculation(public_suffix_list, "bar.hokkaido.jp").should == "Cookies may not be set for bar.hokkaido.jp."
    cookie_calculation(public_suffix_list, "foo.bar.tokyo.jp").should == "Cookies may be set for foo.bar.tokyo.jp."
    cookie_calculation(public_suffix_list, "bar.tokyo.jp").should == "Cookies may not be set for bar.tokyo.jp."
    cookie_calculation(public_suffix_list, "pref.hokkaido.jp").should == "Cookies may be set for pref.hokkaido.jp."
    cookie_calculation(public_suffix_list, "metro.tokyo.jp").should == "Cookies may be set for metro.tokyo.jp."
  end

end
