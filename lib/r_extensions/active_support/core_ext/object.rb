class Object
  
  def is?(object)
    self == object
  end
  
  def or(value)
    self.blank? ? value : self
  end
  
  def controller_name
    self.class.name.tableize
  end
  
  def model_name
    self.class.name
  end
  
end