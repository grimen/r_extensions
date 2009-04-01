class Hash
  
  # Adding a more conventional method alias, like a complement to
  # the opposite method "except" that is already implemented in Rails
  alias_method :only, :slice
  
end