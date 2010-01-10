require 'lib/public_suffix_list'

describe PublicSuffixList do

  it "should calculate tld and cdn correctly" do
    public_suffix_list = PublicSuffixList.new(:effective_tld_names_url => "spec/test.dat")
    public_suffix_list.cdn("foo.bar.com").should == "bar.com"
    public_suffix_list.tld("foo.bar.com").should == "com"
  end

end
