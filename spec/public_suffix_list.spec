require 'lib/public_suffix_list'

describe PublicSuffixList do

  it "should accept both effective_tld_names_url and url" do
    public_suffix_list = PublicSuffixList.new(:effective_tld_names_url => "spec/test.dat")
    public_suffix_list.config.effective_tld_names_url.should == "spec/test.dat"
    public_suffix_list.config.url.should == "spec/test.dat"
    public_suffix_list = PublicSuffixList.new(:url => "spec/test.dat")
    public_suffix_list.config.effective_tld_names_url.should == "spec/test.dat"
    public_suffix_list.config.url.should == "spec/test.dat"
  end

  it "should calculate tld and cdn correctly" do
    public_suffix_list = PublicSuffixList.new(:effective_tld_names_url => "spec/test.dat")
    public_suffix_list.cache_file.should be nil
    public_suffix_list.cdn("foo.bar.com").should == "bar.com"
    public_suffix_list.tld("foo.bar.com").should == "com"
    public_suffix_list.cdn("foobar.com").should == "foobar.com"
    public_suffix_list.tld("foobar.com").should == "com"
  end

  it "should not assume the root name is a top level domain" do
    public_suffix_list = PublicSuffixList.new(:effective_tld_names_url => "spec/test.dat")
    public_suffix_list.cache_file.should be nil
    public_suffix_list.tld("com").should == "com"
    public_suffix_list.tld("bar.foo").should == "bar.foo"
    public_suffix_list.tld("baz.foo").should == "baz.foo"
    public_suffix_list.tld("qux.foo").should == ""
    public_suffix_list.tld("foo").should == ""
  end

  it "should handle edge cases correctly" do
    public_suffix_list = PublicSuffixList.new(:effective_tld_names_url => "spec/test.dat")
    public_suffix_list.cache_file.should be nil
    public_suffix_list.split("").should == ["", "", ""]
    public_suffix_list.cdn("").should == ""
    public_suffix_list.tld("").should == ""
  end

end
