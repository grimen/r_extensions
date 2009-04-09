class DateTime
  
  def time_ago_in_words(relative_date_time, options = {})
    options[:prepend] ||= ''
    options[:append] ||= ''
    sentence = distance_of_time_in_words(relative_date_time, self)
    "#{options[:prepend]}#{sentence}#{options[:append]}"
  end
  
  def time_ago_in_words_from_now(options = {})
    self.time_ago_in_words(Time.now, options)
  end
  
end