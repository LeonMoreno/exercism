class Isogram
  def self.isogram?(input)
    chars = input.downcase.scan(/\w/)
    chars.each_index do |index|
      return false if chars[index + 1, chars.length].include?(chars[index])
    end
  end
end

if $PROGRAM_NAME == __FILE__
  puts Isogram.isogram?("Alphabet")
  puts Isogram.isogram?("LeONardo")
end
