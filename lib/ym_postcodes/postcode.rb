require "json"
require "rest_client"

module YmPostcodes
  class Postcode

    def self.lookup(postcode)
      safe_postcode = URI.encode(postcode)
      self.get_request("/postcodes/#{safe_postcode}")
    end

    def self.lookup_many(postcodes)
      params = {:postcodes => postcodes}.to_json
      self.post_request("/postcodes", params)
    end


    private

    def self.get_request(path)
      begin
        response = RestClient.get self.api_path(path)
      rescue => e
        response = e.response
      end
      JSON.parse(response)
    end

    def self.post_request(path, params)
      begin
        response = RestClient.post(
          self.api_path(path),
          params,
          :content_type => :json,
          :accept => :json
        )
      rescue => e
        response = e.response
      end
      JSON.parse(response)
    end

    def self.api_path(path)
      "#{YmPostcodes.base_url}#{path}"
    end

  end
end
