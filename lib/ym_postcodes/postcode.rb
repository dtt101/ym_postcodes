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

#{"status":200,"result":{"postcode":"S1 2BJ","quality":1,"eastings":435824,"northings":387152,"country":"England","nhs_ha":"Yorkshire and the Humber","admin_county":null,"admin_district":"Sheffield","admin_ward":"Central","longitude":-1.46293025034242,"latitude":53.3800130453946,"parliamentary_constituency":"Sheffield Central","european_electoral_region":"Yorkshire and The Humber","primary_care_trust":"Sheffield","region":"Yorkshire and The Humber","parish":null,"lsoa":"Sheffield 075G","msoa":"Sheffield 075","nuts":"Central","incode":"2BJ","outcode":"S1"}}
