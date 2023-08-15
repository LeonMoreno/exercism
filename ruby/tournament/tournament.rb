=begin
Write your code for the 'Tournament' exercise in this file. Make the tests in
`tournament_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/tournament` directory.
=end

class Tournament
    def self.tally(input)
        matches = input.split("\n")

        team = Hash.new
        matches.each { |match|
            first_team, second_team, result = match.split(";")
            add_team(team, first_team)
            add_team(team, second_team)
            update_results(team, first_team, second_team, result)
        }
        format_result(team)
    end
        
    def self.add_team(team, team_name)
        team[team_name] ||= {mp: 0, w: 0, d: 0, l: 0, p: 0}
    end 

    def self.update_results(team, first_team, second_team, result)
        team[second_team][:mp] += 1
        team[first_team][:mp] += 1
        case result
        when "win"
            team[first_team][:w] += 1
            team[first_team][:p] += 3
            team[second_team][:l] += 1
        when "draw"
            team[first_team][:d] += 1
            team[first_team][:p] += 1
            team[second_team][:d] += 1
            team[second_team][:p] += 1
        when "loss"
            team[first_team][:l] +=1
            team[second_team][:w] += 1
            team[second_team][:p] += 3
        end
     end

     def self.format_result(team)
        file = "Team                           | MP |  W |  D |  L |  P\n"
        tally_sorted = team.sort_by{|fir, sec| [-sec[:p], fir]} # sort_by -- return Array
        tally_sorted.each { |name, res|
            file += '%-30s' % + name + " | " + '%2s' % + res[:mp] + " | " \
             + '%2s' % res[:w]+ " | " + '%2s' % res[:d] + " | " \
            + '%2s' % res[:l] + " | " + '%2s' % res[:p] + "\n"
        }
        return file
    end
end

# file = File.open("file.txt")
# file_data = file.read

# out = Tournament.tally(file_data)

# puts out

# file.close