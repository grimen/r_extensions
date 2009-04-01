require 'RedCloth'

class String
  
  def t(scope = nil)
    I18n.t(self, :scope => scope).textilize(:strip => true)
  end
  
  def to_id
    self.downcase.tableize.singularize
  end
  def to_id!; self.replace self.to_id; end
  
  def textilize(options = {})
    return unless defined?(RedCloth)
    options[:args] = [:filter_styles, :no_span_caps] if options[:safe]
    options[:args] ||= []
    
    result = RedCloth.new(self, options[:args]).to_html #rescue ''
    
    if options[:strip_paragraphs] || options[:strip]
      unless result.blank?
        result = result[3..-1]
        result = result[0..-5]
      else
        result = ''
      end
    end
    result
  end
  def textilize!(options = {}); self.replace self.textilize(options); end
  
  def sanitize(options = {})
    sanitize(self, options)
  end
  def sanitize!(options = {}); self.replace self.sanitize(options); end
  
  def strip_html
    #self.gsub(/<\/?[^>]*>/, '')
    strip_tags(self)
  end
  def strip_html!; self.replace self.strip_html; end
  
  def shorten(length, suffix = Html.more)
    if self.length > (length - 1)
      self.slice(0..(length - 1)) + suffix
    else
      self
    end
  end
  def shorten!(length, suffix = Html.more); self.replace self.shorten(length, suffix); end
  
  def surround(string)
    "#{string}#{self}#{string}"
  end
  def surround!; self.replace self.surround; end
  
  def proceed(string)
    "#{string}#{self}"
  end
  def proceed!; self.replace self.proceed; end
  
  def succeed(string)
    "#{self}#{string}"
  end
  def succeed!; self.replace self.succeed; end
  
  def ago
    "%s %s" % [self, I18n.t('datetime.distance_in_words.ago', :default => 'ago')]
  end
  
end