require 'tmpdir'
require 'lib/public_suffix_list'

options = {
  :cache_dir => Dir.tmpdir,
  :cache_expiry_period => 10,
  :effective_tld_names_url => "spec/test.dat"
}

describe PublicSuffixList do

  before do
    File.delete(File.join(Dir.tmpdir, "test.dat.cache")) if File.exist?(File.join(Dir.tmpdir, "test.dat.cache"))
  end

  it "should cache when instructed to" do
    public_suffix_list = PublicSuffixList.new(options)
    File.exist?(File.join(Dir.tmpdir, "test.dat.cache")).should be true
  end

end
