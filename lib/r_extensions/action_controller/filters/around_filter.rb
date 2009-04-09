module RExtensions
  module ActionController
    module Filters
      module AroundFilter
        def self.included(base)
          base.class_eval do
            extend ClassMethods
          end
        end
        
        module ClassMethods
          def before_filter_with_args(method, options = {})
            before_filter options.reject(:args) do |controller|
              controller.send method, options.slice(:args)
            end
          end
        end
        
      end
    end
  end
end