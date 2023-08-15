=begin
Write your code for the 'Rna Transcription' exercise in this file. Make the tests in
`rna_transcription_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/rna-transcription` directory.
=end

# class Complement
#     def self.of_dna(input)
#         case input
#             when '' then return ''
#             when 'C' then return 'G'
#             when 'G' then return 'C'
#             when 'T' then return 'A'
#             when 'A' then return 'U'
#             when 'ACGTGGTCTTAA' then return 'UGCACCAGAAUU'
#         end
#     end
# end

class Complement
    def self.of_dna(input)
        return input.tr('CGTA', 'GCAU')
    end
end


Complement.of_dna('G')