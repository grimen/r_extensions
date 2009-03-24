class Array
  
  def extract_options_with_defaults!(defaults = {})
    options = self.extract_options!
    options = options.symbolize_keys
    options = options.reverse_merge(defaults)
    return options, self
  end
  
  def stringify
    self.compact.join(' ')
  end
  
end