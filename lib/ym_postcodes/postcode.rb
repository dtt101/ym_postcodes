require "json"

module YmPostcodes
  class Postcode

    def self.lookup(postcode)
      safe_postcode = URI.encode(postcode)
      uri = URI('http://api.postcodes.io/postcodes/' + safe_postcode)
      response = Net::HTTP.get(uri)
      JSON.parse(response)
    end

  end
end

# TODO: make a postcode model for the response, and add data to it

#{"status":200,"result":{"postcode":"S1 2BJ","quality":1,"eastings":435824,"northings":387152,"country":"England","nhs_ha":"Yorkshire and the Humber","admin_county":null,"admin_district":"Sheffield","admin_ward":"Central","longitude":-1.46293025034242,"latitude":53.3800130453946,"parliamentary_constituency":"Sheffield Central","european_electoral_region":"Yorkshire and The Humber","primary_care_trust":"Sheffield","region":"Yorkshire and The Humber","parish":null,"lsoa":"Sheffield 075G","msoa":"Sheffield 075","nuts":"Central","incode":"2BJ","outcode":"S1"}}
