require "ym_postcodes/version"
require "ym_postcodes/postcode"

module YmPostcodes

  @base_url = 'http://api.postcodes.io'

	class << self
		attr_accessor :base_url
	end

end
