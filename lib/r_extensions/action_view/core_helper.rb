require 'markaby' #'nokogiri'

module RExtensions
  module ActionView
    module CoreHelper
      
      def render_html(&block)
        #(block_given? ? ::Nokogiri::HTML::Builder.new(&block).to_html : '') rescue ''
        (block_given? ? ::Markaby::Builder.new(&block) : '') rescue ''
      end
      
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
        attributes.merge({:id => "#{controller.controller_name}_#{controller.action_name}",
        :class => "controller_#{controller.action_name} action_#{controller.action_name}"})
      end
      
    end
  end
end