# typed: strict
require 'public_suffix_list'

describe PublicSuffixList do

  it "should be case insensitive" do
    p = PublicSuffixList.new
    p.split("fee.fi.fo.com").should == ["fee.fi", "fo", "com"]
    p.cdn("fee.fi.fo.com").should == "fo.com"
    p.tld("fee.fi.fo.com").should == "com"
    p.split("FEE.FI.FO.COM").should == ["FEE.FI", "FO", "COM"]
    p.cdn("FEE.FI.FO.COM").should == "FO.COM"
    p.tld("FEE.FI.FO.COM").should == "COM"
    p.split("Fee.Fi.Fo.Com").should == ["Fee.Fi", "Fo", "Com"]
    p.cdn("Fee.Fi.Fo.Com").should == "Fo.Com"
    p.tld("Fee.Fi.Fo.Com").should == "Com"
  end

end
