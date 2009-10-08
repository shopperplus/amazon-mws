class Hash
  def self.from_query_string(string)
    query = string.split(/\?/)[-1]
    parts = query.split(/&|=/)
    Hash[*parts]
  end
end

class Array
  def extract_options!
    last.is_a?(::Hash) ? pop : {}
  end
end

module Enumerable
  def to_query_string
    self.map { |k,v| "%s=%s" % [URI.encode(k.to_s), URI.encode(v.to_s)] }.join('&') unless self.empty?
  end
end

module Kernel
  def __method__(depth = 0)
    caller[depth][/`([^']+)'/, 1]
  end if RUBY_VERSION <= '1.8.7'
  
  def __called_from__
    caller[1][/`([^']+)'/, 1]
  end if RUBY_VERSION > '1.8.7'
  
  def expirable_memoize(reload = false, storage = nil)
    current_method = RUBY_VERSION > '1.8.7' ? __called_from__ : __method__(1)
    storage = "@#{storage || current_method}"
    if reload 
      instance_variable_set(storage, nil)
    else
      if cache = instance_variable_get(storage)
        return cache
      end
    end
    instance_variable_set(storage, yield)
  end

  def require_library_or_gem(library, gem_name = nil)
    if RUBY_VERSION >= '1.9'
      gem(gem_name || library, '>=0') 
    end
    require library
  rescue LoadError => library_not_installed
    begin
      require 'rubygems'
      require library
    rescue LoadError
      raise library_not_installed
    end
  end
end