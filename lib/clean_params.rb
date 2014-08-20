require "clean_params/version"
require 'active_support/core_ext/hash'

module CleanParams
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end
  
  def self.clean(controllerParams)
    configuration.extract_params(controllerParams.with_indifferent_access)
    return configuration
  end

  class Configuration
    attr_accessor :params
    
    def extract_params(controllerParams)
      params.each do |key, val|
        self.class.send(:attr_accessor, key)
        instance_variable_set("@#{key}", get_value_from_params(val, controllerParams))
      end
    end
    
    def get_value_from_params(val, controllerParams)
      if val.is_a? String
        val = val.split(",")
      end
      val.each do |param|
        answer = search_hash(controllerParams, param)
        return answer if answer
      end
      nil # return nil if no match
    end
    
    def search_hash(h, search)
      return h[search] if h.fetch(search, nil)

      h.keys.each do |k|
        answer = search_hash(h[k], search) if h[k].is_a? Hash
        return answer if answer
      end

      nil
    end
  end
end
