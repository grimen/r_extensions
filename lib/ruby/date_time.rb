#require 'active_support'

class DateTime
  
  def distance_in_words(relative_date_time, options = {})
    options[:prefix] ||= ''
    options[:suffix] ||= ''
    options[:prefix] + distance_of_time_in_words(relative_date_time, self) + options[:suffix]
  end
  
  def distance_in_words_from_now(options = {})
    self.distance_in_words(Time.now, options)
  end
  
end