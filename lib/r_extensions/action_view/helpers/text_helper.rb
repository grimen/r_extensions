# Source: http://benjaminthomas.org/2009/01/30/smart-html-truncate.html
require 'nokogiri'

module RExtensions
  module ActionView
    module Helpers
      module TextHelper
        
        def html_truncate(input, num_words = 15, truncate_string = '...')
          doc = Nokogiri::HTML(input)
          
          current = doc.children.first
          count = 0
          
          while current != nil
            # we found a text node
            if current.class == Nokogiri::XML::Text
              count += current.text.split.length
              # we reached our limit, let's get outta here!
              break if count > num_words
            end
            
            if current.children.length > 0
              # this node has children, can't be a text node,
              # lets descend and look for text nodes
              current = current.children.first
            elsif not current.next.nil?
              #this has no children, but has a sibling, let's check it out
              current = current.next
            else 
              # we are the last child, we need to ascend until we are
              # either done or find a sibling to continue on to
              n = current
              while n.parent.next.nil? and n != doc
                n = n.parent
              end
              
              if n == doc
                current = nil
              else
                current = n.parent.next
              end
            end
          end
          
          if count >= num_words
            new_content = current.text.split(/ /)
            
            # the most confusing part. we want to grab just the first [num_words]
            # number of words, but this last text node could send us way over
            # our limit.  So, we need to find the difference between the number
            # of words we wanted and the number of words total we found (count - num_words)
            # to find how many we need to take off of this last text node
            # so we subtract from the number of words in this text node.
            # Finally we add 1 because we are doing a range and we need to get the index right.
            new_content = new_content[0..(new_content.length-(count-num_words)+1)]
            
            current.content= new_content.join(' ') + truncate_string
            
            #remove everything else
            while current != doc
              while not current.next.nil?
                current.next.remove
              end
              current = current.parent
            end
          end
          
          # now we grab the html and not the text.
          # we do first because nokogiri adds html and body tags
          # which we don't want
          doc.children.first.children.first.inner_html
        end
      
      end
    end
  end
end