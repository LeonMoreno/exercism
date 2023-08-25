class Isogram
  def self.isogram?(input)
    text_in_array = input.downcase.scan(/\w/)
    text_in_array == text_in_array.uniq
  end
end

if $PROGRAM_NAME == __FILE__
  puts Isogram.isogram?("Alphabet")
  puts Isogram.isogram?("LeONardo")
  puts Isogram.isogram?("Leon Mri tquy")
end