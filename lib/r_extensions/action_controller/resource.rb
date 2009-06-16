module RExtensions
  module ActionController
    module Resource
      def self.included(base)
        base.class_eval do
          include InstanceMethods
          
          before_filter :set_pagination_defaults
        end
      end
      
      module InstanceMethods
        
        def pagination_defaults
          {
            :page => @page,
            :per_page => @per_page
          }
        end
        
        protected
        
        def set_pagination_defaults
          @page = (params[:page] || 1).to_i
          @page = 1 if @page < 1
          #@per_page = (params[:per_page] || (RAILS_ENV == 'test' ? 2 : RExtensions.options[:default_per_page])).to_i
          #@per_page = (params[:per_page] || (RAILS_ENV == 'test' ? 2 : 20)).to_i
        end
        
      end
      
    end
  end
end