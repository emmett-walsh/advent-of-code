require_relative "../lib/passphrase_validator.rb"

describe PassphraseValidator do
  describe "#number_of_valid_passphrases" do
    it "returns 0 for an empty string" do
      passphrase_validator = PassphraseValidator.new
      expect(passphrase_validator.number_of_valid_passphrases("")).to eq(0)
    end

    it "returns 0 for a single word" do
      passphrase_validator = PassphraseValidator.new
      expect(passphrase_validator.number_of_valid_passphrases("aa")).to eq(0)
    end

    it "returns 0 when first and last word are the same" do
      passphrase_validator = PassphraseValidator.new
      expect(passphrase_validator.number_of_valid_passphrases("aa bb cc dd aa")).to eq(0)
    end

    it "returns 0 when first word is the same as any other word" do
      passphrase_validator = PassphraseValidator.new
      expect(passphrase_validator.number_of_valid_passphrases("aa bb cc aa ee")).to eq(0)
    end

    it "returns 0 when any word appears more than once" do
      passphrase_validator = PassphraseValidator.new
      expect(passphrase_validator.number_of_valid_passphrases("aa bb cc bb ee")).to eq(0)
    end

    it "returns 1 when passed one valide passphrase among several" do
      passphrase_validator = PassphraseValidator.new
      expect(passphrase_validator.number_of_valid_passphrases("aa bb cc bb ee\naa bb cc dd ee")).to eq(1)
    end

    it "returns 2 when passed two valid passphrases and one invalid" do
      passphrase_validator = PassphraseValidator.new
      expect(passphrase_validator.number_of_valid_passphrases("aaa bbb")).to eq(1)
    end
  end
end
