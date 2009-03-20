class Object
  
  def or(value)
    self.blank? ? value : self
  end
  
end