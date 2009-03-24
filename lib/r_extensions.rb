# TODO: Get options to work
module RExtensions
  
  def options
    @options ||= {}
    @options[:default_per_page] ||= 20
  end
  
  def extract_options_with_defaults!(args, defaults = {})
    options = args.extract_options!
    options = options.symbolize_keys
    options = options.reverse_merge(defaults)
    return options, args
  end
  
  def log(message, var)
    logger.debug "[r_extensions]: #{message}" if RAILS_ENV != 'production'
  end
  
end