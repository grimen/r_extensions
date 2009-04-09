module RExtensions
  module ActiveRecord
    module Base
      def self.included(base)
        base.class_eval do
          extend ClassMethods
          include InstanceMethods
        end
      end
      
      module ClassMethods
        
        def helpers
          ActionController::Base.helpers
        end
        
        # Basic idea: http://github.com/kalasjocke/find_or_create_by
        
        def find_or_create_by(conditions = {})
          find_or(:create, conditions)
        end
        
        def find_or_new_by(conditions = {})
          find_or(:new, conditions)
        end
        
        private
        
        def find_or(method, conditions)
          self.find(:conditions => conditions) || self.send(method, :conditions => conditions)
        end
        
      end
      
      module InstanceMethods
        
        def permalink
          if self.name.present?
            "#{self.id}-#{self.name.parameterize}"
          else
            "#{self.id}"
          end
        end
        
        def to_param
          self.permalink
        end
        
      end
      
    end
  end
end