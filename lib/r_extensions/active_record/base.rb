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
        
        # Make helpers accessible from models in same way as controllers
        def helpers
          ActionController::Base.helpers
        end
        
        # Build and create records unsafely, bypassing attr_accessible.
        
        def unsafe_build(attrs)
          record = new
          record.unsafe_attributes = attrs
          record
        end
        
        def unsafe_create(attrs)
          record = unsafe_build(attrs)
          record.save
          record
        end
        
        def unsafe_create!(attrs)
          unsafe_build(attrs).save!
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
        
        def unsafe_update_attributes(attrs)
          self.unsafe_attributes = attrs
          self.save
        end
        
        def unsafe_update_attributes!(attrs)
          self.unsafe_attributes = attrs
          self.save!
        end
        
        def unsafe_attributes=(attrs)
          attrs.each do |k, v|
            send("#{k}=", v)
          end
        end
        
        # def permalink
        #           if self.name.present?
        #             "#{self.id}-#{self.name.parameterize}"
        #           else
        #             "#{self.id}"
        #           end
        #         end
        #         
        #         def to_param
        #           self.permalink
        #         end
        
      end
      
    end
  end
end