require 'lib/public_suffix_list'

describe PublicSuffixList do

  before do
    @public_suffix_list = PublicSuffixList.new(:effective_tld_names_url => "spec/test.dat")
  end

  it "should calculate tld and cdn correctly" do
    @public_suffix_list.cdn("foo.bar.com").should == "bar.com"
    @public_suffix_list.tld("foo.bar.com").should == "com"
    @public_suffix_list.cdn("foobar.com").should == "foobar.com"
    @public_suffix_list.tld("foobar.com").should == "com"
  end

  it "should handle edge cases correctly" do
    @public_suffix_list.split("").should == ["", "", ""]
    @public_suffix_list.cdn("").should == ""
    @public_suffix_list.tld("").should == ""
  end

end
