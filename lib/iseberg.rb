require "iseberg/version"
require "iseberg/client"

module Iseberg
  def self.client(options)
    @client ||= Iseberg::Client.new(options)
  end
end
