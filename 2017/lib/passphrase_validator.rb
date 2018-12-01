class PassphraseValidator
  def initialize
    @valid_passwords_count = 0
  end

  def number_of_valid_passphrases(passphrases_string)
    passphrases = passphrases_string.split("\n")
    passphrases.each do |passphrase_string|
      passphrase = passphrase_string.split(" ")
      if passphrase_valid?(passphrase)
        @valid_passwords_count += 1
      end
    end
    @valid_passwords_count
  end

  private

  def passphrase_valid?(passphrase)
    return false if passphrase.length == 1
    valid = true
    passphrase.each do |word|
      valid = false if passphrase.include?(passphrase.shift)
    end
    valid
  end
end
