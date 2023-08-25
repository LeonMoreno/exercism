# class Isogram
#   def self.isogram?(input)

#     is_isogram = true
#     input.downcase!
#     input.chars.each_index do |index|
#       if input[index] != '-' && input[index] != ' '
#         is_isogram = false if input[index + 1, input.length].include?(input[index])
#       end
#     end
#     is_isogram
#   end
# end

# if $PROGRAM_NAME == __FILE__
#   puts Isogram.isogram?("Alphabet")
#   puts Isogram.isogram?("LeONardo")
# end

def ejecutar(num)
  @res1 = num * 2
  false
end

def ensayo(num)
  
  ejecutar(num) && true if num % 2 == 0
  

end

res = ensayo(4)
p res
p @res1