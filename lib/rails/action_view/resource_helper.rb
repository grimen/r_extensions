require 'markaby' #'nokogiri'

module RExtensions
  module ActionView
    module ResourceHelper
      
      def heading(title, options = {}, &block)
        options[:hx] ||= :h3
        
        sub_heading = block_content(&block)
        sub_heading.textilize!(:strip_paragraphs => true)
        
        render_html do
          h3.heading title
          p.sub_heading do
            text sub_heading
          end
        end
      end
      
      def collection_info(collection, options = {})
        options[:as] ||= :items
        options[:prefix] = 'Found'
        options[:suffix] = nil
        
        render_html do
          p.collection_info do
            text "#{options[:prefix]} "
            strong.collection_size collection.size rescue 0
            text " #{options[:as].to_s.pluralize}."
            text "#{options[:suffix]}"
          end
        end
      end
      
      def value(object, attribute, default_value = '', options = {})
        options[:escape] ||= true
        begin
          specified_value = object.send(attribute.to_sym).to_s
          specified_value = h(specified_value) if options[:escape]
          specified_value.blank? ? content_tag(:span, h(default_value.to_s), :class => 'no_value') : specified_value
        rescue
          content_tag(:span, h(default_value.to_s), :class => 'no_value')
        end
      end
      
      # TODO: make attribute accept an array instead of only a symbol, [..., :owner, :first_name]
      def value_new(object, attribute, default_value = '', options = {})
        options[:escape] ||= true
        default_output = render_html do
          span.no_value h(default_value.to_s)
        end
        
        begin
          specified_value = object.send(attribute.to_sym).to_s
          specified_value = h(specified_value) if options[:escape]
          specified_value.blank? ? default_output : specified_value
        rescue
          default_output
        end
      end
      
      def render_items(collection, options = {})
        if collection.blank?
          return render_html do
            p.empty do
              text options[:empty]
            end
          end
        end
        
        options[:as] ||= collection.first.class.name.tableize
        options[:partial] ||= "/#{options[:as].to_s.pluralize}/item" #options[:as].to_s.singularize
        options[:pagination] = options[:pagination].blank? ? [:top, :bottom] : options[:pagination].to_a
        options[:class] = [
            'items',
            options[:as].to_s.pluralize
          ].compact.join(' ')
          
        content = {}
        content[:pagination_top] = pagination(collection, :class => 'top')
        content[:items] = render(:partial => options[:partial], :collection => collection)
        content[:pagination_bottom] = pagination(collection, :class => 'bottom')
        
        render_html do
          text content[:pagination_top] if options[:pagination].include?(:top)
          div options.slice(:class) do
            content[:items]
          end
          text content[:pagination_bottom] if options[:pagination].include?(:bottom)
        end
      end
      
    end
  end
end