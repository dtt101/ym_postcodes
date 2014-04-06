require_relative '../lib/ym_postcodes'
require 'spec_helper'

describe YmPostcodes::Postcode do

  describe '.lookup' do

    context 'when postcode is found' do

      it 'responds with 200' do
        response = YmPostcodes::Postcode.lookup("S1 2BJ")
        expect(response['status']).to eq(200)
      end

    end

  end

end
