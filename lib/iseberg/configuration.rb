module Iseberg
  class Configuration
    CONFIG_KEYS = [:psn_ip, :username, :password]
    attr_accessor *CONFIG_KEYS

    def initialize(config_hash = nil)
      if config_hash.is_a?(Hash)
        config_hash.each do |config_name, config_value|
          self.send("#{config_name}=", config_value)
        end
      end
    end

    def config_keys
      CONFIG_KEYS.inject({}) do |keys_hash, key|
        keys_hash[key] = send(key)
        keys_hash
      end
    end

    def valid?
      CONFIG_KEYS.none?{ |key| send(key).nil? || send(key).empty? }
    end
  end
end
