require 'json'
require 'iseberg/response/endpoint'

module Iseberg
  class Endpoint
    PATH = "config/endpoint"
    attr_reader :methodize

    def initialize(client)
      @client = client
    end

    def get_all(filter_string = nil)
      result = @client.connection.get(PATH) do |req|
        req.params['filter'] = filter_string unless filter_string.nil?
      end
      endpoint_list = []
      if result.success?
        JSON.parse(result.body)["SearchResult"]["resources"].each do |endpoint|
          endpoint_list << Iseberg::Response::Endpoint.new(endpoint)
        end
      end
    endpoint_list
    end

    def get(id)
      result = @client.connection.get("#{PATH}/#{id}")
      Iseberg::Response::Endpoint.new(JSON.parse(result.body)["ERSEndPoint"]) if result.success?
    end

    def get_by_name(name)
      result = @client.connection.get("#{PATH}/name/#{name}")
      Iseberg::Response::Endpoint.new(JSON.parse(result.body)["ERSEndPoint"]) if result.success?
    end

    def update(endpoint)
      result = @client.connection.put endpoint.link do |req|
        req.headers['Content-Type'] = 'application/json'
        req.body = endpoint.to_json
      end
      result
    end

    def create(endpoint)
      result = @client.connection.post PATH do |req|
        req.headers['Content-Type'] = 'application/json'
        req.body = endpoint.to_json
      end
      result
    end

    def delete(endpoint)
      if endpoint.class == String
        result = @client.connection.delete "#{PATH}/#{endpoint}"
      else
        result = @client.connection.delete endpoint.link
      end
      result
    end

    def self.methodize
      "endpoint"
    end
  end
end
