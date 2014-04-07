
RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end

def test_postcode
	"S1 2BJ"
end

def invalid_postcode
  "NOPOSTCODE"
end

def valid_postcodes
  ["S1 2BJ", "OX49 5NU", "M32 OJG"]
end

def valid_region
  "Yorkshire and The Humber"
end

def valid_postcode_response
  response =
  '{
     "status": 200,
     "result": {
         "postcode": "S1 2BJ",
         "quality": 1,
         "eastings": 435824,
         "northings": 387152,
         "country": "England",
         "nhs_ha": "Yorkshire and the Humber",
         "admin_county": null,
         "admin_district": "Sheffield",
         "admin_ward": "Central",
         "longitude": -1.46293025034242,
         "latitude": 53.3800130453946,
         "parliamentary_constituency": "Sheffield Central",
         "european_electoral_region": "Yorkshire and The Humber",
         "primary_care_trust": "Sheffield",
         "region": "Yorkshire and The Humber",
         "parish": null,
         "lsoa": "Sheffield 075G",
         "msoa": "Sheffield 075",
         "nuts": "Central",
         "incode": "2BJ",
         "outcode": "S1"
     }
  }'
  JSON.parse(response)
end
