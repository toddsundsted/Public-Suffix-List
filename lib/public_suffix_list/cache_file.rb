# typed: true
class PublicSuffixList

  class CacheFile

    def initialize(config)
      @config = config
      @data = {}
    end

    def cache?
      @config.cache_dir && File.directory?(@config.cache_dir) && true || false
    end

    def file
      path = URI.parse(@config.url)&.path&.split("/")&.last || ""
      File.join(@config.cache_dir, path + ".cache")
    end

    def exist?
      cache? && File.exist?(file) && true || false
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
      @data.empty? and load_data
      @data
    end

    def [](key)
      data[key]
    end

    def []=(key, value)
      data.merge!({key => value, created_at: Time.now, tag: rand(2821109907456).to_s(36)}) and dump_data
    end

    def expired?
      !cache? or !([0, nil].include?(@config.cache_expiry_period) or data[:created_at] + @config.cache_expiry_period > Time.now)
    end

  end

end
