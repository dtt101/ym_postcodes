require_relative '../lib/ym_postcodes'
require 'spec_helper'

describe YmPostcodes::Postcode do

  describe '.lookup' do

    context 'when postcode is found' do

      it 'responds with 200' do
        response = YmPostcodes::Postcode.lookup("S1 2BJ")
        expect(response['status']).to eq(200)
      end

      it 'responds with postcode details' do
        response = YmPostcodes::Postcode.lookup("S1 2BJ")
        # test for hash response - see
      end

    end

    context 'when postcode is not found' do

      it 'responds with 404' do
        response = YmPostcodes::Postcode.lookup("NOPOSTCODE")
        expect(response['status']).to eq(404)
      end

    end

  end

end
