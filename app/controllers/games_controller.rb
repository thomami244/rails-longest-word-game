require "open-uri"

class GamesController < ApplicationController
  VOWELS = %w(A E I O U Y)

  def new
    @letters = Array.new(5) { VOWELS.sample }
    @letters += Array.new(5) { (('A'..'Z').to_a - VOWELS).sample }
    @letters.shuffle!
  end

  def score
    @letters = params[:letters].split
    @word = (params[:word] || "").upcase
    @included = included?(@word, @letters)
    @english_word = english_word?(@word)
  end

  private

  def included?(word, letters)
    word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
  end

  def english_word?(word)
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end
end

#   def new
#    # TODO: generate random grid of letters
#     @letters = []
#     grid_size = 10
#     grid_size.times do
#       @letters << ('A'..'Z').to_a.sample
#     end
#     # @first_letter = @letters[0]
#   end

#   def score
#   # raise
#     @answer = params[:answer]
#     @letters = params[:letters]
#     @letters.upcase!
#     letter_test = true

#     grid_new = @letters
#     count = 0

#       split_attempt = @letters.split('').each { |c|
#         if grid_new.include?(c)
#           grid_new.delete_at(grid_new.find_index(c))
#          # count += 1
#         else
#           letter_test = false
#           break
#         end
#        }

#       if letter_test == true
#           @message= "Well done"
#       else
#           @message= "not in the grid"
#         end
#     # else
#     #   @message= "not an english word"
#     end


#     # The word can’t be built out of the original grid
#     # The word is valid according to the grid, but is not a valid English word
#     # The word is valid according to the grid and is an English word


# end
