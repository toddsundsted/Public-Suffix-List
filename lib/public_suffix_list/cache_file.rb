class PublicSuffixList

  class CacheFile

    def initialize(config)
      @config = config
    end

    def cache?
      @config.cache_dir && File.directory?(@config.cache_dir) && true
    end

    def file
      File.join(@config.cache_dir, URI.parse(@config.effective_tld_names_url).path.split("/").last + ".cache") if cache?
    end

    def exist?
      File.exist?(file) if cache?
    end

    def delete
      File.delete(file) if exist?
    end

    def load_data
      open(file, "r") { |f| @data = Marshal.load(f) } if exist?
    end

    def dump_data
      open(file, "w") { |f| Marshal.dump(@data, f) } if cache?
    end

    def data
      @data or (load_data and @data) or @data = {:created_at => Time.now, :tag => rand(36**8).to_s(36)}
    end

    def data=(data)
      @data = data and dump_data
    end

    def expired?
      !cache? or !([0, nil].include?(@config.cache_expiry_period) or data[:created_at] + @config.cache_expiry_period > Time.now)
    end

    def read_attribute(attribute)
      data[attribute]
    end

    def write_attribute(attribute, value)
      data[attribute] = value
    end

  end

end
