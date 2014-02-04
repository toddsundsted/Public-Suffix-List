require 'tmpdir'
require 'public_suffix_list'

describe PublicSuffixList do

  it "should handle the cases in the rdoc synopsis" do
    PublicSuffixList.new.tld("foobar.com").should == "com"
    PublicSuffixList.new.cdn("foobar.com").should == "foobar.com"
    PublicSuffixList.new(:cache_dir => "/tmp").split("abc.xyz.co.uk").should == ["abc", "xyz", "co.uk"]
    PublicSuffixList.new(:cache_dir => "/tmp", :cache_expiry_period => 100).split("test.nhs.uk").should == ["test", "nhs", "uk"]
    p = PublicSuffixList.new
    p.split("fee.fi.fo.com").should == ["fee.fi", "fo", "com"]
    p.cdn("fee.fi.fo.com").should == "fo.com"
    p.tld("fee.fi.fo.com").should == "com"
    PublicSuffixList.new(:url => "spec/test.dat")
  end

end
