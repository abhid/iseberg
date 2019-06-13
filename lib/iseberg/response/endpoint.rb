module Iseberg
  module Response
    class Endpoint
      attr_reader :id, :name, :link
      attr_accessor :description

      def initialize(endpoint)
        @id = endpoint["id"]
        @name = endpoint["name"]
        @mac = endpoint["mac"]
        @profileId = endpoint["profileId"]
        @staticProfileAssignment = endpoint["staticProfileAssignment"]
        @groupId = endpoint["groupId"]
        @staticGroupAssignment = endpoint["staticGroupAssignment"]
        @portalUser = endpoint["portalUser"]
        @identityStore = endpoint["identityStore"]
        @identityStoreId = endpoint["identityStoreId"]

        @link = endpoint["link"]["href"] if endpoint.key? "link"
      end

      def to_json
        {
          "ERSEndPoint" => {
            "id" => @id,
            "name" => @name,
            "description" => @description,
            "mac" => @mac,
            "profileId" => @profileId,
            "staticProfileAssignment" => @staticProfileAssignment,
            "groupId" => @groupId,
            "staticGroupAssignment" => @staticGroupAssignment,
            "portalUser" => @portalUser,
            "identityStore" => @identityStore,
            "identityStoreId" => @identityStoreId
          }
        }.to_json
      end
    end
  end
end
