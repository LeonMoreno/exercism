class Crypto
  private

  attr_accessor :number_of_columns, :number_of_rows
  attr_reader :sanitized_text

  def initialize(plain_text)
    @sanitized_text = sanitize_input(plain_text)
    size_the_rectangle(sanitized_text.length)
  end

  def size_the_rectangle(length)
    return sanitized_text if sanitized_text.empty?

    self.number_of_columns = Math.sqrt(length).floor(0)
    self.number_of_rows = length / number_of_columns if length.positive?

    evalued = evaluate_conditions(length) until evalued
  end

  def increment_columns
    self.number_of_columns += 1
  end

  def decrement_rows
    self.number_of_rows -= 1
  end

  def evaluate_conditions(length)
    if number_of_rows * number_of_columns < length
      increment_columns and false
    elsif number_of_columns < number_of_rows
      decrement_rows and false
    else
      (number_of_columns - number_of_rows) <= 1
    end
  end

  def sanitize_input(plain_text)
    # benefit of "duck typing":
    # String and Array are the methods length & slice!
    # plain_text.downcase.gsub(/\W/, '')
    plain_text.downcase.scan(/\w/)
  end

  def encoded_text
    text_in_slices = []
    number_of_rows.times do
      text_in_slices << sanitized_text.slice!(0, number_of_columns)
    end
    number_of_columns.times do |index|
      text_in_slices.last[index] = ' ' unless text_in_slices.last[index]
    end
    to_transpose(text_in_slices)
  end

  def to_transpose(text_in_slices)
    text_transpose = []
    number_of_columns.times do
      text_in_slices.each { |word| text_transpose << word.slice!(0) }
    end
    text_transpose.join
  end

  def text_in_chunks(encoded_text)
    encoded_text_in_chunks = String.new
    number_of_columns.times do |index|
      encoded_text_in_chunks << encoded_text.slice!(0, number_of_rows).to_s
      encoded_text_in_chunks << ' ' if index < number_of_columns - 1
    end
    encoded_text_in_chunks
  end

  public

  def ciphertext
    return '' if sanitized_text.empty?

    text_in_chunks(encoded_text)
  end
end

if $PROGRAM_NAME == __FILE__
  puts Crypto.new("hola leo.").ciphertext
  # puts Crypto.private_instance_methods(false)
  puts Crypto.new("... --- ...").ciphertext
  puts Crypto.new("If man was meant to stay on the ground, god would have given us roots.").ciphertext
end
