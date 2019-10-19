# typed: strong
class PublicSuffixList

  class CacheFile

    sig { params(config: Config).void }
    def initialize(config)
    end

    sig { returns(T::Boolean) }
    def cache?
    end

    sig { returns(String) }
    def file
    end

    sig { returns(T::Boolean) }
    def exist?
    end

    sig { void }
    def delete
    end

    sig { void }
    def load_data
    end

    sig { void }
    def dump_data
    end

    sig { returns(T::Hash[T.untyped, T.untyped]) }
    def data
    end

    sig { params(key: T.untyped).returns(T.untyped) }
    def [](key)
    end

    sig { params(key: T.untyped, value: T.untyped).void }
    def []=(key, value)
    end

    sig { returns(T::Boolean) }
    def expired?
    end

  end

end
