require_relative '../lib/ym_postcodes'

require 'spec_helper'

describe YmPostcodes::Postcode do

  describe '.lookup' do

    context 'when postcode is found' do

      it 'responds with 200' do
        response = YmPostcodes::Postcode.lookup(test_postcode)
        expect(response['status']).to eq(200)
      end

      it 'responds with postcode details' do
        response = YmPostcodes::Postcode.lookup(test_postcode)
        expect(response).to eq(valid_postcode_response)
      end

    end

    context 'when postcode is not found' do

      it 'responds with 404' do
        response = YmPostcodes::Postcode.lookup(invalid_postcode)
        expect(response['status']).to eq(404)
      end

    end

  end

  describe '.lookup_many' do

    context 'when postcodes are found' do

      it 'responds with 200' do
        response = YmPostcodes::Postcode.lookup_many(valid_postcodes)
        expect(response['status']).to eq(200)
      end

      it 'responds with postcode details' do
        response = YmPostcodes::Postcode.lookup_many(valid_postcodes)
        region = ''
        response['result'].each do |postcode|
          if postcode["query"] == test_postcode
            if postcode["result"]
              region = postcode["result"]["region"]
            end
          end
        end
        expect(region).to eq(valid_region)
      end

    end

  end

end
