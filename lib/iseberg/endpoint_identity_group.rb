module Iseberg
  class EndpointIdentityGroup
    PATH = "config/endpointgroup"
    attr_reader :methodize

    def initialize(client)
      @client = client
    end

    def get_some

    end

    def get_all
      p "eig"
    end

    def self.methodize
      "endpointgroup"
    end

  end
end
