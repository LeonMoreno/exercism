# # require "byebug"
# =begin
# Write your code for the 'Crypto Square' exercise in this file. Make the tests in
# `crypto_square_test.rb` pass.

# To get started with TDD, see the `README.md` file in your
# `ruby/crypto-square` directory.
# =end

class Crypto
  def initialize(plain_txt)
    @sanitized_txt = sanitize_input(plain_txt)
  end

  def ciphertext
    return '' if @sanitized_txt&.empty?

    size_the_rectangle(@sanitized_txt.length)
    text_in_chunks(normalize_text)
  end

  private

  def size_the_rectangle(len)
    @col = Math.sqrt(len).to_i
    @row = len / @col if len.positive?

    loop do
      res = evaluate_conditions(len)
      break if res
    end
  end

  def evaluate_conditions(len)
    if @row * @col < len
      @col += 1
      return false
    elsif @col < @row
      @row -= 1
      return false
    end
    return false if (@col - @row) > 1

    true
  end

  def sanitize_input(plain_txt)
    plain_txt.downcase.gsub(/\W/, '')
  end

  def normalize_text
    nmr_txt = []
    @row.times do
      nmr_txt << @sanitized_txt.slice!(0, @col)
    end
    @col.times do |index|
      nmr_txt.last[index] = ' ' unless nmr_txt.last[index]
    end
    ft_transpose(nmr_txt)
  end

  def ft_transpose(nmr_txt)
    res = []
    @col.times do
      nmr_txt.each { |x| res << x.slice!(0) }
    end
    res.join
  end

  def text_in_chunks(norm_txt)
    res = String.new
    @col.times do |i|
      res << norm_txt.slice!(0, @row).to_s
      res << ' ' if i < @col - 1
    end
    res
  end
end

# Crypto.new("hola leo.").ciphertext
# puts Crypto.new("... --- ...").ciphertext
# puts Crypto.new("If man was meant to stay on the ground, god would have given us roots.").ciphertext