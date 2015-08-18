require "msg91/version"
require 'excon'

module Msg91
  class ApiError < RuntimeError; end

  class Client

    def self.text(mobile_number, message)
      raise Errors::OpError unless message
      process_sms(mobile_number, message)
    end

    def self.process_sms(mobile_number, message)

      authkey = ENV['SMSAUTHKEY']
      sender  = ENV['SENDER']
      route   = ENV['ROUTE']
      country = ENV['COUNTRY']
      mobiles = mobile_number
      
      raise ArgumentError, 'Please set authkey, sender, route && country for MSG91 API' unless authkey && sender && route && country


      params = { :authkey => authkey, :mobiles => mobiles, :message => message, 
                 :sender => sender, :route => route, :country => country }

      res = Excon.get('http://api.msg91.com/api/sendhttp.php', :query => URI.encode_www_form(params))
      
      if res.status == 200
        res.body
      else
        Rails.logger.error(res.body)                          
        raise Errors::SMSNotSent, res.body
      end
    end
  end
end