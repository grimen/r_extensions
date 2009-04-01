module RExtensions
  module ActionView
    module Helpers
      module UrlHelper
        
        def current?(controller_expression = nil, action_expression = nil, params_expressions = nil)
          current = true
          current &= if controller_expression
            if controller_expression.is_a?(String)
              controller.controller_name == controller_expression
            else
              controller.controller_name =~ controller_expression
            end
          end
          current &= if action_expression
            if action_expression.is_a?(String)
              controller.action_name == action_expression
            else
              controller.action_name =~ action_expression
            end
          end
          # TODO
          # current &= if params_expressions
          #   # params_expressions.all? do |key, value|
          #   #   value.is_a?(String) ? params[key] == value : params[key] =~ value
          #   # end
          # end
          current
        end
        
        def last_page_url
          session[:last_page]
        end
        
        def link_to_block(url, options = {}, &block)
          content = block_content(&block)
          link_to content, url, options
        end
        
      end
    end
  end
end