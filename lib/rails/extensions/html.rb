class Html
  
  HTML_EMPTY_SPACE = '&nbsp;'.freeze    # => " "
  HTML_UNICODE_MORE = '&#8230;'.freeze   # => "..."
  
  def self.space
    HTML_EMPTY_SPACE
  end
  
  def self.more
    HTML_UNICODE_MORE
  end
  
end