module RExtensions
  def self.included(base)
    base.class_eval do
      extend ClassMethods
    end
  end
  
  def options
    @options ||= {}
    @options[:default_per_page] ||= 20
    @options
  end
  
  module ClassMethods
    
    def extract_options_with_defaults!(args, defaults = {})
      options = args.extract_options!
      options = options.symbolize_keys
      options = options.reverse_merge(defaults)
      return options, args
    end
    
    def log(message)
      logger.debug "[r_extensions]: #{message}" unless RExtensions.env_production?
    end
    
    def method_missing(method, *args)
      rails_env_ex = /^env_(.+)\?$/
      
      # Asking for current environment? I.e. env_production?
      if match = rails_env_ex.match(method.to_s)
        Rails.env == match[1]
      else
        super
      end
    end
    
  end
  
end