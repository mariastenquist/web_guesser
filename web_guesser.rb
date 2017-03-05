require 'sinatra'
require 'sinatra/reloader'


SECRET_NUMBER = rand(100)

	def check_guess(guess)
		if guess == SECRET_NUMBER
			message = "You win! The SECRET NUMBER is #{SECRET_NUMBER}"
		elsif guess.between?((SECRET_NUMBER - 5), SECRET_NUMBER)
				message = "Guess too low!"
		elsif guess.between?(SECRET_NUMBER, (SECRET_NUMBER + 5))
			message = "Guess too high!"
		elsif guess < (SECRET_NUMBER - 5)
			message = "Guess way too low!"
		elsif guess > (SECRET_NUMBER + 5)
			message = "Guess way too high!"
		else
			"What happened?"
		end
	end


	get '/' do
	  guess = params["guess"].to_i
	  m = check_guess(guess)
	  erb :index, :locals => {:number => SECRET_NUMBER, :message => m}
end