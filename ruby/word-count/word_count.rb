class Phrase
  def initialize(input_phrase)
    @words = split_by_words(input_phrase.downcase)
  end

  def split_by_words(input_phrase)
    words = input_phrase.split(/[^a-zA-Z0-9']+/).reject(&:empty?)
    satinize_words(words)
  end

  def satinize_words(words)
    words.map! do |word|
      if (san_word = search_apostrophe(word))
        san_word
      else
        word
      end
    end.reject!(&:empty?)
    words
  end

  def search_apostrophe(word)
    return word[1..-2] if word[0]&.include?("'") && word[-1]&.include?("'")
    return word[1..] if word[0]&.include?("'")
    return word[0..-2] if word[-1]&.include?("'")

    nil
  end

  def word_count
    counts = {}
    @words.each do |word|
      if counts.include?(word)
        counts[word] += 1
      else
        counts[word] = 1
      end
    end
    counts
  end
end

if $PROGRAM_NAME == __FILE__
  res = Phrase.new("Joe can't tell 'between 'large' and large.")
  p res.word_count
end