module SafetyPatrol

	module Padrino

		class SafteyViolation < StandardError
			
			attr_reader :user, :action, :resource

			def initialize(user, action, resource)
				@user = user
				@action = action
				@resource = resource
			end

			def message
				"#{@user.class} is not authorized to #{@action} this resource: #{@resource.class}"
			end

		end

	end

end
