require 'cloudflare_localizable/version'
require 'cloudflare_localizable/country'

# This module can be included in any Rails controller that needs country
# information. You get a helper method called cf_country to be used whenever you
# need to know the country of the user.
#
# === Example
#
#   class ExampleController < ApplicationController
#     include CloudFlareLocalizable
#
#     def index
#       cf_country.code # => "BB"
#       cf_country.name # => "Barbados"
#     end
#   end
module CloudFlareLocalizable
  CF_HEADER = 'HTTP_CF_IPCOUNTRY'.freeze

  def self.included(base)
    base.send(:helper_method, :cf_country)
  end

  # Returns the real name of the country, based on the country code.
  def cf_country
    @_cf_country ||= Country.find(code: request.headers[CF_HEADER] || 'XX')
  end
end
