module SafetyPatrol
  
  module Padrino    
  
    module Helpers
      
      def can?(action, resource, &block)
          can_perform_action = safety_patrol_user.send(("can_#{action.to_s}?").intern, resource)
          yield(can_perform_action) if block_given?
          can_perform_action
      end
      
      def can!(action, resource)
        raise "can! cannot be passed a block" if block_given?
        can_perform_action = can?(action, resource)
        raise SafetyPatrol::Padrino::SafteyViolation.new(safety_patrol_user, action.to_s, resource) unless can_perform_action
      end      
        
      def safety_patrol_user
        send(SafetyPatrol.configuration.user_method)
      end
      
    end

  end

end