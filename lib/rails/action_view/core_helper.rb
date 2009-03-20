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
      
      def current?(controller_regex = nil, action_regex = nil, params_regex = {})
        current = true
        current &= (controller.controller_name =~ controller_regex) unless controller_regex.nil?
        current &= (controller.action_name =~ action_regex) unless action_regex.nil?
        #current &&= ((params_regex.reject { |k,v| !(params[k] =~ /#{params_regex[k]}/) }).size > 0) unless params_regex.blank?
        current
      end
      alias :is_current? :current?
      
    end
  end
end