module RExtensions
  module ActionController
    module Base
      def self.included(base)
        base.class_eval do
          include InstanceMethods
          
          before_filter :set_last_page
        end
      end
      
      module InstanceMethods
        
        def redirect_back_or_default(default)
          redirect_to_url = session[:return_to] || default
          redirect_to redirect_to_url if redirect_to_url
          session[:return_to] = nil
        end
        
        protected
        
        def set_last_page
          session[:return_to] = session[:last_page] = request.request_uri rescue root_url
          session[:last_controller] = controller.controller_name rescue nil
          session[:last_action] = controller.action_name rescue nil
          logger.debug "[DEBUG] :set_last_page"
        end
        
      end
     
    end
  end
end