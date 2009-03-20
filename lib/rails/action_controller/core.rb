require 'action_controller'

module RExtensions
  module ActionController
    module Core
      def self.included(base)
        base.send :include, InstanceMethods
      end
      
      module InstanceMethods
        
        protected
        
        def redirect_back_or_default(default)
          redirect_to_url = session[:return_to] || default
          redirect_to redirect_to_url if redirect_to_url
          session[:return_to] = nil
        end
        
        def set_last_page
          session[:return_to] = session[:last_page] = request.request_uri rescue root_url
          session[:last_controller] = controller.controller_name rescue nil
          session[:last_action] = controller.action_name rescue nil
        end
        
        def last_page_url
          session[:last_page]
        end
        
      end
      
    end
  end
end