require 'markaby' #'nokogiri'

module RExtensions
  module ActionView
    module Helpers
      module FormHelper
        
        def ajax_commit_button(text, options = {})
          commit_button = button(text, 'javascript:return false;', :onclick => "javascript:$('form').submit();")
          
          render_html do
            li do
              text commit_button
              script "$('form').keypress(function (e) { if (e.which == 13) { $('form').submit(); }});"
            end
          end
        end
        
        def or_action(text, url, options = {})
          content = link_to(text, url, options)
          
          render_html do
            li.or_action do
              span ' or '
              text content
            end
          end
        end
        
        def notes(options = {}, &block)
          content = capture_content(&block)
          
          render_html do
            fieldset.notes do
              ol do
                content
              end
            end
          end
        end
        
        def note(options = {}, &block)
          content = textilize_without_paragraphs(capture_content(&block))
          
          render_html do
            li.note do
              div :class => options[:class] do
                content
              end
            end
          end
        end
        
      end
    end
  end
end