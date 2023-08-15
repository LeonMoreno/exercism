=begin
Write your code for the 'Robot Name' exercise in this file. Make the tests in
`robot_name_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/robot-name` directory.
=end

class Robot
  attr_reader :name

  @@robots = []

  def initialize
    init_factory
  end

  def init_factory
    loop do
      @name = generate_name
      unless @@robots.index(@name)
        # puts "es falso tonces breake"
        break
      end
    end
    @@robots << @name
  end

  def generate_name
    name = (0...2).map { ('A'..'Z').to_a[rand(26)] }.join
    name + (0..2).map { rand(10) }.join
  end

  def self.forget
    @@robots.clear
  end

  def self.list_robots
    @@robots
  end

  def reset
    @@robots.delete(@name)
    init_factory
  end
end

# r1 = Robot.new.name
# puts r1
