# phrase.split(/[\s-]/).map { |word| word[0] }.join.upcase All_in_OneLine

class Acronym

  def self.abbreviate(phrase)
    # @phrase = phrase
    # firts_letter(sanitized_and_split).join.upcase
    phrase.scan(/\b\w/)
  end

#   def self.sanitized_and_split
#     @phrase.split(/[\s-]/)
#   end
# end

# def firts_letter(split_phrase)
#   split_phrase.map do |word|
#     word[0]
#   end
end

if $PROGRAM_NAME == __FILE__
  p Acronym.abbreviate('Hola leo.! siempre-ando!')
  p Acronym.abbreviate('Something - I made up from thin air!')
end

