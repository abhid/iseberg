require 'faraday'
require 'iseberg/configuration'

require 'iseberg/endpoint'
require 'iseberg/endpoint_identity_group'

module Iseberg
  class Client
    API_NAMESPACES = [ Iseberg::Endpoint, Iseberg::EndpointIdentityGroup]
    attr_accessor :connection
    
    def initialize(psn_ip, username, password)
      @connection = Faraday.new(:url => "https://#{psn_ip}:9060/ers/") do |conn|
        conn.basic_auth(username, password)
        conn.adapter Faraday.default_adapter
        conn.ssl[:verify] = false
        conn.headers["Accept"] = "application/json"
      end

      # Create namespaces for the different namespaces in the API
      @singleton_objects = Hash.new
      API_NAMESPACES.each do |namespace|
        define_singleton_method namespace.methodize do
          @singleton_objects[namespace.methodize] ||= namespace.new(self)
        end
      end
    end
  end
end
