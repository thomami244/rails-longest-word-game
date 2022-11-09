class GamesController < ApplicationController

  def new
   # TODO: generate random grid of letters
    @letters = []
    grid_size = 10
    grid_size.times do
      @letters << ('A'..'Z').to_a.sample
    end
    # @first_letter = @letters[0]
  end

  def score
  # raise
    @answer = params[:answer]
    @letters = params[:letters]
    @letters.upcase!
    letter_test = true
    
    grid_new = @letters
    count = 0

      split_attempt = @letters.split('').each { |c|
        if grid_new.include?(c)
          grid_new.delete_at(grid_new.find_index(c))
         # count += 1
        else
          letter_test = false
          break
        end
       }

      if letter_test == true
          @message= "Well done"
      else
          @message= "not in the grid"
        end
    # else
    #   @message= "not an english word"
    end


    # The word can’t be built out of the original grid
    # The word is valid according to the grid, but is not a valid English word
    # The word is valid according to the grid and is an English word


end
