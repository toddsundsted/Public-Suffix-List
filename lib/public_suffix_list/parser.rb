class PublicSuffixList

  module Parser

    def self.parse(lines)
      lines.inject({}) do |a, line|
        line.strip!
        unless line =~ %r{//} or line.empty?
          t = a
          line.split(".").reverse.each do |p|
            t[p] = {} unless t[p]
            t = t[p]
          end
        end
        a
      end
    end

  end

end
