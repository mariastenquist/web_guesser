require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

	get '/' do
	  guess = params["guess"].to_i
	  message = check_guess(guess)

	  erb :index, :locals => {:color => @color, :message => message}
	end

	def check_guess(guess)
		if guess == SECRET_NUMBER
			@color = "green"
			message = "You win! The secret num is #{SECRET_NUMBER}"
		elsif guess.between?((SECRET_NUMBER - 5), SECRET_NUMBER)
				@color = 'salmon'
				message = "Guess too low!"
		elsif guess.between?(SECRET_NUMBER, (SECRET_NUMBER + 5))
				@color = 'salmon'
			message = "Guess too high!"
		elsif guess < (SECRET_NUMBER - 5)
				@color = 'red'
			message = "Guess way too low!"
		elsif guess > (SECRET_NUMBER + 5)
				@color = 'red'
			message = "Guess way too high!"
		end
	end