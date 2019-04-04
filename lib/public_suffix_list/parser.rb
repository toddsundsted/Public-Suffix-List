class PublicSuffixList

  module Parser

    # com
    # *.jp
    # *.hokkaido.jp
    # *.tokyo.jp
    # !pref.hokkaido.jp
    # !metro.tokyo.jp

    # {
    #   "com" => {:term => true}, 
    #   "jp" => {
    #     "tokyo" => {"!metro" => {:term => true}, "*" => {:term => true}},
    #     "hokkaido" => {"!pref" => {:term => true}, "*" => {:term => true}},
    #     "*" => {:term => true}
    #   }
    # }

    def self.parse(lines)
      lines.inject({}) do |acc, line|
        line.gsub!(/\s.*/, "")
        unless line =~ %r{//} or line.empty?
          tmp = acc
          line.split(".").reverse.each do |p|
            tmp[p] = {} unless tmp[p]
            tmp = tmp[p]
          end
          tmp[:term] = true
        end
        acc
      end
    end

  end

end
