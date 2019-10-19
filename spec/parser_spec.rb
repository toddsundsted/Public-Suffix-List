# typed: false
require 'public_suffix_list'

describe PublicSuffixList do

  describe ".parse" do

    context "rules is empty" do
      it "returns the terminal" do
        PublicSuffixList::Parser.parse([]).should eq({})
      end
    end

    it "parses rules" do
      PublicSuffixList::Parser.parse(["com"]).should eq({"com" => {:term => true}})
      PublicSuffixList::Parser.parse(["com foo"]).should eq({"com" => {:term => true}})
      PublicSuffixList::Parser.parse([".com."]).should eq({"com" => {:term => true}})
      PublicSuffixList::Parser.parse(["com", "foo.com"]).should eq({"com" => {"foo" => {:term => true}, :term => true}})
      PublicSuffixList::Parser.parse(["foo.com", "com"]).should eq({"com" => {"foo" => {:term => true}, :term => true}})
      PublicSuffixList::Parser.parse(["foo.com", "bar.com"]).should eq({"com" => {"foo" => {:term => true}, "bar" => {:term => true}}})
      PublicSuffixList::Parser.parse(["*.jp"]).should eq({"jp" => {"*" => {:term => true}}})
      input = %w[
        com
        *.jp
        *.hokkaido.jp
        *.tokyo.jp
        !pref.hokkaido.jp
        !metro.tokyo.jp
      ]
      output = {
        "com" => {:term => true},
        "jp" => {
          "tokyo" => {"!metro" => {:term => true}, "*" => {:term => true}},
          "hokkaido" => {"!pref" => {:term => true}, "*" => {:term => true}},
          "*" => {:term => true}
        }
      }
      PublicSuffixList::Parser.parse(input).should eq(output)
    end

  end

end
