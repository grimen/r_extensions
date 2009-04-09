module RExtensions
  module ActionController
    module Security
      def self.included(base)
        base.class_eval do
          filter_parameter_logging :password, :password_confirmation
        end
      end
      
    end
  end
end