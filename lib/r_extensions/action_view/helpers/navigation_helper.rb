require 'markaby' #'nokogiri'

module RExtensions
  module ActionView
    module Helpers
      module NavigationHelper
        
        def pagination(collection, options = {})
          render(:partial => '/shared/pagination', :locals => {:collection => collection, :options => options})
        end
        
        def menu(id, type, options={}, &block)
          options[:id] = "#{id}_#{type}_menu"
          options[:class] = [
              "#{type}_menu",
              (options[:class] unless options[:class].blank?)
            ].compact.join(' ')
          
          content = capture_content(&block)
          
          render_html do
            div options.slice(:id, :class) do
              ul :class => type.to_s.pluralize do
                content
              end
            end
          end
        end
        
        def tab_menu(id, options={}, &block)
          menu(id, :tab, options, &block)
        end
        
        def tab(name, url, options = {})
          options.reverse_merge!(
            :text => name.to_s.titleize,
            :title => '',
            :accesskey => nil,
            :align => :left,
            :extra_info => nil
          )
          
          options[:id] = "#{name}_tab"
          options[:class] = [
              'tab',
              ('current' if options[:current]),
              (options[:align] unless options[:align].blank?),
              (options[:class] unless options[:class].blank?)
            ].compact.join(' ')
          options[:href] = url
          
          render_html do
            li options.slice(:id, :class) do
              a options.slice(:href, :title, :accesskey) do
                text options[:text]
                span.extra_info(options[:extra_info]) unless options[:extra_info].blank?
              end
            end
          end
        end
        
        def tab_content(id, options = {}, &block)
          options[:id] = "#{id}_tab_content"
          options[:class] = [
              'tab_content',
              (options[:class] unless options[:class].blank?)
            ].compact.join(' ')
          
          content = capture_content(&block)
          
          render_html do
            div options.slice(:id, :class) do
              content
            end
          end
        end
        
        def buttons(options = {}, &block)
          options[:class] = [
              'actions',
              (options[:class] unless options[:class].blank?)
            ].compact.join(' ')
          
          content = capture_content(&block)
          
          render_html do
            p options.slice(:class) do
              content
            end
          end
        end
        
        def button(text, url, options = {})
          options[:class] = [
              'action',
              options.delete(:icon),
              ('current' if options.delete(:current)),
              options[:class]
            ].compact.join(' ')
          
          html = render_html do
            span.left ' '
            span.middle do
              span.text text
              small.extra(options.delete(:extra)) unless options[:extra].blank?
            end
            span.right ' '
          end
          
          link_to(html, url, options)
        end
        
        def filter_buttons(options = {}, &block)
          options[:class] = [
              'inline_list filters',
              options[:class]
            ].compact.join(' ')
          
          content = capture_content(&block)
          
          render_html do
            div options.slice(:class) do
              ul options.slice(:class) do
                content
              end
            end
          end
        end
        
        def filter_button(text, url, options = {})
          options[:class] = [
              'option',
              ('current' if options[:current]),
              options[:class]
            ].compact.join(' ')
          options[:href] = url
          
          render_html do
            li do
              a options.slice(:class, :href, :title, :accesskey) do
                span.left ' '
                span.middle do
                  span.text.icon text
                end
                span.right ' '
              end
            end
          end
        end
        
      end
    end
  end
end