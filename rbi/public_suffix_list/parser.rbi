# typed: strong
class PublicSuffixList

  module Parser

    sig { params(lines: T::Enumerable[String]).returns(T::Hash[T.untyped, T.untyped]) }
    def self.parse(lines)
    end

  end

end
