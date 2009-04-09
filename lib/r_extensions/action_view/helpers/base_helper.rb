require 'markaby' #'nokogiri'

module RExtensions
  module ActionView
    module Helpers
      module BaseHelper
        
        def render_html(&block)
          #(block_given? ? ::Nokogiri::HTML::Builder.new(&block).to_html : '') rescue ''
          (block_given? ? ::Markaby::Builder.new(&block) : '') rescue ''
        end
        alias_method :html, :render_html
        
        def capture_content(&block)
          (block_given? ? capture(&block) : '') rescue ''
        end
        
        def block_content(&block)
          unless block.blank?
            content = capture(&block)
            content.strip! rescue content = nil
          end
        end
        
        def body_attrs(attributes = {})
          controller_name = controller.controller_name
          action_name = controller.action_name
          
          attributes[:class] = [
              "controller_#{controller_name}",
              "action_#{action_name}",
              attributes[:class]
            ].compact.join(' ')
            
          attributes = attributes.reverse_merge(
              :id => "#{controller_name}_#{action_name}"
            )
        end
        
      end
      
    end
  end
end