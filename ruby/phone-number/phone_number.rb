=begin
Write your code for the 'Phone Number' exercise in this file. Make the tests in
`phone_number_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/phone-number` directory.
=end

class PhoneNumber
  def self.clean(input)
    input.gsub!(/\D/, '')
    input = test_number(input)
    return nil if input.nil?

    valid_codes(input)
  end

  def self.test_number(input)
    input.delete_prefix!('1') if input[0] == '1'
    return nil if input.size != 10

    input
  end

  def self.valid_codes(input)
    return nil unless (2..9).include?(input[0].to_i) && (2..9).include?(input[3].to_i)

    input
  end
end
