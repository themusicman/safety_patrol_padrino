# SafetyPatrol Padrino
This is a set of helpers to make using SafeyPatrol in Padrino a little nicer

## Installation

Add this line to your application's Gemfile:

    gem 'safety_patrol_padrino'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install safety_patrol_padrino

## Usage

	#checkout the Usage of the SafetyPatrol gem to see how to configure the basic authorization setup
	#below is the usage specfic to Padrino

	#in your app/app.rb file add:
	register SafetyPatrol::Padrino

	#in the config/boot.rb file inside the Padrino.before_load block add:	
	SafetyPatrol.configure do |config|

		#set what method you application uses to get the currently logged in user
		config.user_method = :current_user

		#also set any extra abilities your application needs here
		config.abilities[:send] = :sendable

	end


	#inside of a route definition call the authorize method

	post :create, map: '/users' do

		user = User.new(params[:user])

		halt 403 unless can?(:create, user)

		or pass it a block
		can?(:create, user) do |can_perform_action|
			halt 403 unless can_perform_action
		end

		or use the can! method 
		can!(:create, user)


	end




## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
