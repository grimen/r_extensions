class Object
  
  def value?
    !self.blank?
  end
  
  def or(value)
    self.blank? ? value : self
  end
  
end