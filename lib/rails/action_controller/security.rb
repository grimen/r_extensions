require 'action_controller'

module RExtensions
  module ActionController
    module Security
      def self.included(base)
        base.send :include, InstanceMethods
      end
      
      module InstanceMethods
        #filter_parameter_logging :password, :password_confirmation
      end
      
    end
  end
end