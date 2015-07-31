require 'json'
require 'logger'
require 'forwardable'

require "msg91/client"
require "msg91/version"

module Msg91
  class ApiError < RuntimeError; end
  
  class << self
    attr_writer :logger
    extend Forwardable
    
    def_delegators :client, 
                   :authkey, :sender, :route,
                   :authkey=, :sender=, :route=
    
    def_delegators :client, :authkey, :sender, :route
                   
    
    def logger
      @logger ||= lambda {
        logger = Logger.new($stdout)
        logger.level = Logger::INFO
        logger
      }.call
    end
    
    def client
      @client ||= Msg91::Client.new(
        :authkey    => ENV['MSG91_AUTHKEY'],
        :sender => ENV['MSG91_SENDER'] 
      )
    end
    
  end

end