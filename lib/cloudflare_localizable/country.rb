# frozen_string_literal: true

require 'cloudflare_localizable/country_list'

module CloudFlareLocalizable
  # This class represents a country, and stores name and code for the countries.
  #
  # === Example
  #
  #     country = Country.find('BB')
  #     country.code # => "BB"
  #     country.name # => "Barbados"
  class Country
    attr_accessor :name, :code

    def self.find(code)
      record = CF_COUNTRIES.find { |country| country[:code] == code } || {}

      new(record.fetch(:code, 'XX'), record.fetch(:name, 'Unknown'))
    end

    def initialize(code = 'XX', name = 'Unknown')
      self.code = code
      self.name = name
    end
  end
end
