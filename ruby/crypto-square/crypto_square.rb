=begin
Write your code for the 'Crypto Square' exercise in this file. Make the tests in
`crypto_square_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/crypto-square` directory.
=end

class Crypto
  def initialize(plaintex)
    @plaint_txt = plaintex
  end

  def ciphertext
    puts @plaint_txt
  end
end
