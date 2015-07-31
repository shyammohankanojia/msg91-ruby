require 'excon'

module Msg91
  class Client
    attr_accessor :authkey, :sender, :api_url

    CONFIG = { :api_url => 'https://control.msg91.com/api/', }
    
    WEBHOOK_PARAMS = [
      :authkey, 
      :sender, 
      :route,
      :mobiles, 
      :message
    ]  

    def initialize(*args)
      options = args[0]
      unless options.is_a?(Hash)
        options = { authkey: args[0], sender: args[1] }.merge(args[2] || {})
      end
      
      self.authkey, self.sender = options.values_at(:authkey, :sender)
      self.api_url =  options[:api_url] || CONFIG[:api_url]
      self.read_timeout = options[:read_timeout].to_f unless options[:read_timeout].nil?
    end



    private
    
    def api_call method, path, params = {}

      uri = resource_path(path)
      
      Msg91.logger.debug { 
        "[Msg91 API] #{method.upcase} #{uri} \n params: #{params} \n" 
      }
      
      request = case method
                when :get
                  Excon.get(uri)
                when :post, :patch
                  Excon.post(uri, 
                      :body => params.to_json)
                end
      
      raise_error(request) if request.status >= 400
      
      response = JSON.parse(request.body)
      raise_error(response) unless response['success']
      response
      
    end
        
    def raise_error response
      case response
      when Hash
        raise ApiError, response['message']
      else
        raise ApiError, response.body || response.status
      end
    end
    


  end
end


    
    
    
    
    
    
    
    

    
    
  end
end