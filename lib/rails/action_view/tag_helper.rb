require 'markaby' #'nokogiri'

module RExtensions
  module ActionView
    module TagHelper
      
      def textilize(options = {}, &block)
        options[:strip] ||= true
        content = block_content(&block)
        content.textilize(options)
      end
      
      def link_to_block(url, options = {}, &block)
        content = block_content(&block)
        link_to content, url, options
      end
      
    end
  end
end