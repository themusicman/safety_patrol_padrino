require 'safety_patrol'
require_relative 'padrino/helpers'
require_relative 'padrino/safety_violation'

module SafetyPatrol

	module Padrino

		VERSION = '0.5.0'

	    class << self
	      def registered(app)
	         app.helpers SafetyPatrol::Padrino::Helpers
	      end
	      alias :included :registered
	    end

	end

	class Configuration
		attr_accessor :user_method 
	end

end


