require "json"

require "rest_client"

module YmPostcodes
  class Postcode

    def self.lookup(postcode)
      safe_postcode = URI.encode(postcode)
      self.request('get', "/postcodes/#{safe_postcode}")
    end

    private

    def self.request(method, path)
      begin
        response = RestClient.get "#{YmPostcodes.base_url}#{path}"
      rescue => e
        response = e.response
      end
      JSON.parse(response)
    end

  end
end


# TODO: setup webmock for tests https://github.com/bblimke/webmock & http://robots.thoughtbot.com/how-to-stub-external-services-in-tests
# TODO: add batch lookup
# TODO: look at adding request method with try and exceptions
