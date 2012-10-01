require "active_support/inflector"

class String
  
  def rubyify
    self.underscore
  end
  
  def billyfy
    self.to_s.camelize(:lower).pluralize
  end

end