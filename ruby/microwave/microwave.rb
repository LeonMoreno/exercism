=begin
Write your code for the 'Microwave' exercise in this file. Make the tests in
`microwave_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/microwave` directory.
=end

class Microwave
  def initialize(input)
    @input = input
  end

  def timer
    min, sec = @input.divmod(100)
    # puts "min = #{min} sec = #{sec}"
    min += sec / 60
    sec %= 60
    # puts "min = #{min} sec = #{sec}"
    '%02d:%02d' % [min, sec]
  end
end

puts Microwave.new(59).timer
