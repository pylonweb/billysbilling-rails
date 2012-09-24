require "active_support/inflector"

class Hash

  # Converts all of the keys to strings, optionally formatting key name
  def rubyify_keys!
    keys.each{|k|
      v = delete(k)
      new_key = k.to_s.underscore
      self[new_key] = v
      v.rubyify_keys! if v.is_a?(Hash)
      v.each{|p| p.rubyify_keys! if p.is_a?(Hash)} if v.is_a?(Array)
    }
    self
  end
  
  def billyfy_keys!
    keys.each{|k|
      v = delete(k)
      new_key = k.to_s.camelize(:lower)
      self[new_key] = v
      v.rubyify_keys! if v.is_a?(Hash)
      v.each{|p| p.billyfy_keys! if p.is_a?(Hash)} if v.is_a?(Array)
    }
    self
  end
  
  def success?
    self["success"]
  end

end