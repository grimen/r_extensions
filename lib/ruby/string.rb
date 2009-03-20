require 'RedCloth'

class String
  
  def to_id
    # TODO: implement string.downcase.tableize with regular expression instead
    self
  end
  def to_id!; self.replace self.to_id; end
  
  def slugorize
    result = self.downcase
    result.gsub!(/&(\d)+;/, '') # Ditch Entities
    result.gsub!('&', 'and') # Replace & with 'and'
    result.gsub!(/['"]/, '') # replace quotes by nothing
    result.gsub!(/\W/, ' ') # strip all non word chars
    result.gsub!(/\ +/, '-') # replace all white space sections with a dash
    result.gsub!(/(-)$/, '') # trim dashes
    result.gsub!(/^(-)/, '') # trim dashes
    result
  end
  def slugorize!; self.replace self.slugorize; end
  
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
  
  def shorten(length, suffix = '&#8230;')
    if self.length > (length - 1)
      self.slice(0..(length - 1)) + suffix
    else
      self
    end
  end
  def shorten!(length, suffix = '&#8230;'); self.replace self.shorten(length, suffix); end
  
end