require "clean_params/version"
#require 'active_support/core_ext/hash'

module CleanParams
  class << self
    attr_accessor :configuration
  end

  # Sets configuration object
  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end
  
  # main method call; returns the final object
  def self.clean(controllerParams)
    #configuration.reset_config
    configuration.controller_params = controllerParams
    configuration.extract_params
    return configuration
  end

  class Configuration
    attr_accessor :params, :controller_params
    
    # for each rule in configuration file, check the params hash and sets instance variables
    def extract_params
      params.each do |key, val|
        set_instances(key, val)
      end
    end
    
    def reset_config
      (self.instance_variables - self.params.keys.map {|a| "@#{a}".to_sym}.push("@params".to_sym)).each {|var| remove_instance_variable("#{var}".to_sym) }
    end
    
    def set_instances(key, val)
      self.class.send(:attr_accessor, key)
      instance_variable_set("@#{key}", get_value_from_params(val, controller_params))
    end
    
    # search params hash for values in rules
    def get_value_from_params(val, controllerParams)
      paramVariations = val[0]
      defaultValue = val[1]
      if paramVariations.is_a? String
        paramVariations = paramVariations.split(",")
      end
      paramVariations.each do |param|
        answer = search_hash(controllerParams, param)
        return answer if answer
      end
      defaultValue # return default if no match
    end
    
    # Utility method: search hash recursively
    def search_hash(h, search)
      return h[search] if h.fetch(search, nil)
      h.keys.each do |k|
        answer = search_hash(h[k], search) if h[k].is_a? Hash
        return answer if answer
      end
      nil
    end
    
    # return nil if no rule for this attribute
    def method_missing(method, *args, &block)
      #set_instances(method, [method.to_s])
      controller_params["#{method}"]
    end
  end
end
