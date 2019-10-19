# typed: strong
class PublicSuffixList

  class Config

    sig { void }
    def initialize
    end

  end

  sig { params(options: T::Hash[Symbol, T.any(Integer, String)]).void }
  def initialize(options = {})
  end

  sig { returns(T::Hash[T.untyped, T.untyped]) }
  def rules
  end

  sig { params(domain: String).returns(T::Array[String]) }
  def split(domain)
  end

  sig { params(domain: String).returns(String) }
  def tld(domain)
  end

  sig { params(domain: String).returns(String) }
  def cdn(domain)
  end

  private

  sig { void }
  def fetch
  end

  sig { void }
  def cache
  end

  sig { void }
  def uncache
  end

  sig {
    params(
      domain: T::Array[String],
      rules: T::Hash[T.untyped, T.untyped],
      wildcard: T::Boolean
    ).returns(T::Array[T::Array[String]])
  }
  def match(domain, rules, wildcard = false)
  end

  sig { params(results: T::Array[T::Array[String]]).returns(T::Array[String]) }
  def best(results)
  end

  sig { params(domain: T::Array[String], n: Integer).returns(T::Array[String]) }
  def gimme!(domain, n = 1)
  end

end
