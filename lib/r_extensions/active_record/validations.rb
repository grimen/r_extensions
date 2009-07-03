module RExtensions
  module ActiveRecord
    module Validations
      def self.included(base)
        base.class_eval do
          extend ClassMethods
        end
      end
      
      module ClassMethods
        
        def validates_as_email(field, options = {})
          mail_name_regex = '[\w\.%\+\-]+'
          domain_head_regex = '(?:[A-Z0-9\-]+\.)+'
          domain_tld_regex = '(?:[A-Z]{2}|aero|ag|asia|at|be|biz|ca|cc|cn|com|de|edu|eu|fm|gov|gs|jobs|jp|in|info|me|mil|mobi|museum|ms|name|net|nu|nz|org|tc|tw|tv|uk|us|vg|ws)'
          email_field_regex ||= /\A#{email_name_regex}@#{domain_head_regex}#{domain_tld_regex}\z/i
          
          validates_length_of field, :within => 6..100
          validates_format_of field, :with => email_field_regex, :message => ::I18n.t('authlogic.error_messages.email_invalid')
          validates_uniqueness_of field, :if => "#{field}_changed?".to_sym
        end
        
      end
    
    end
  end
end