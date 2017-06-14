require 'tmpdir'
require 'public_suffix_list'
require 'timecop'

describe PublicSuffixList do

  FILE = File.join(Dir.tmpdir, "test.dat.cache")

  before do
    File.delete(FILE) if File.exist?(FILE)
  end

  it "should cache when instructed to do so" do
    File.exist?(FILE).should be false
    public_suffix_list = PublicSuffixList.new(:effective_tld_names_url => "spec/test.dat", :cache_dir => Dir.tmpdir, :cache_expiry_period => 10)
    public_suffix_list.cache_file.cache?.should be true
    public_suffix_list.cache_file.exist?.should be true
    created_at = public_suffix_list.cache_file.data[:created_at]
    tag = public_suffix_list.cache_file.data[:tag]
    public_suffix_list = PublicSuffixList.new(:effective_tld_names_url => "spec/test.dat", :cache_dir => Dir.tmpdir, :cache_expiry_period => 10)
    public_suffix_list.cache_file.cache?.should be true
    public_suffix_list.cache_file.exist?.should be true
    public_suffix_list.cache_file.data[:created_at].should == created_at
    public_suffix_list.cache_file.data[:tag].should == tag
  end

  it "should fetch a new data file when the cache expiry has passed" do
    File.exist?(FILE).should be false
    public_suffix_list = PublicSuffixList.new(:effective_tld_names_url => "spec/test.dat", :cache_dir => Dir.tmpdir, :cache_expiry_period => 10)
    public_suffix_list.cache_file.cache?.should be true
    public_suffix_list.cache_file.exist?.should be true
    created_at = public_suffix_list.cache_file.data[:created_at]
    tag = public_suffix_list.cache_file.data[:tag]
    Timecop.travel(Time.now + 15) do
      public_suffix_list = PublicSuffixList.new(:effective_tld_names_url => "spec/test.dat", :cache_dir => Dir.tmpdir, :cache_expiry_period => 10)
      public_suffix_list.cache_file.cache?.should be true
      public_suffix_list.cache_file.exist?.should be true
      public_suffix_list.cache_file.data[:created_at].should_not == created_at
      public_suffix_list.cache_file.data[:tag].should_not == tag
    end
  end

  it "should not fetch a new data file when the cache expiry has not passed" do
    File.exist?(FILE).should be false
    public_suffix_list = PublicSuffixList.new(:effective_tld_names_url => "spec/test.dat", :cache_dir => Dir.tmpdir, :cache_expiry_period => 10)
    public_suffix_list.cache_file.cache?.should be true
    public_suffix_list.cache_file.exist?.should be true
    created_at = public_suffix_list.cache_file.data[:created_at]
    tag = public_suffix_list.cache_file.data[:tag]
    Timecop.travel(Time.now + 5) do
      public_suffix_list = PublicSuffixList.new(:effective_tld_names_url => "spec/test.dat", :cache_dir => Dir.tmpdir, :cache_expiry_period => 10)
      public_suffix_list.cache_file.cache?.should be true
      public_suffix_list.cache_file.exist?.should be true
      public_suffix_list.cache_file.data[:created_at].should == created_at
      public_suffix_list.cache_file.data[:tag].should == tag
    end
  end

  it "should allow 0 or nil to specify an infinite cache expiry period" do
    File.exist?(FILE).should be false
    public_suffix_list = PublicSuffixList.new(:effective_tld_names_url => "spec/test.dat", :cache_dir => Dir.tmpdir, :cache_expiry_period => 10)
    public_suffix_list.cache_file.exist?.should be true
    public_suffix_list.cache_file.expired?.should be false
    public_suffix_list.cache_file.data[:created_at] = Time.now - 100
    public_suffix_list.cache_file.expired?.should be true
    public_suffix_list.cache_file.exist?.should be true
    public_suffix_list.cache_file.delete
    public_suffix_list.cache_file.exist?.should be false
    public_suffix_list = PublicSuffixList.new(:effective_tld_names_url => "spec/test.dat", :cache_dir => Dir.tmpdir, :cache_expiry_period => 0)
    public_suffix_list.cache_file.exist?.should be true
    public_suffix_list.cache_file.expired?.should be false
    public_suffix_list.cache_file.data[:created_at] = Time.now - 10000000
    public_suffix_list.cache_file.expired?.should be false
    public_suffix_list.cache_file.exist?.should be true
    public_suffix_list.cache_file.delete
    public_suffix_list.cache_file.exist?.should be false
    public_suffix_list = PublicSuffixList.new(:effective_tld_names_url => "spec/test.dat", :cache_dir => Dir.tmpdir, :cache_expiry_period => nil)
    public_suffix_list.cache_file.exist?.should be true
    public_suffix_list.cache_file.expired?.should be false
    public_suffix_list.cache_file.data[:created_at] = Time.now - 10000000
    public_suffix_list.cache_file.expired?.should be false
    public_suffix_list.cache_file.exist?.should be true
  end

end
