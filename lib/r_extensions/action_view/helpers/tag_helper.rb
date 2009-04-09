require 'markaby' #'nokogiri'

module RExtensions
  module ActionView
    module Helpers
      module TagHelper
        
        # Textilize the block content using RedCloth, i.e. Textile => HTML
        def textilize(options = {}, &block)
          options[:strip] ||= true
          content = block_content(&block)
          content.textilize(options)
        end
        
      end
    end
  end
end