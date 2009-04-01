module ActiveSupport
  class TimeWithZone
    
    def time_ago_in_words_from(relative_date_time, options = {})
      sentence = ActionController::Base.helpers.distance_of_time_in_words(relative_date_time, self, options)
    end
    
    def time_ago_in_words_from_now(options = {})
      time_ago_in_words_from(Time.now, options)
    end
    
  end
end