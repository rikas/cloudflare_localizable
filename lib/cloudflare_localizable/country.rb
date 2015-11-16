require 'cloudflare_localizable/country_list'

module CloudFlareLocalizable
  class Country
    attr_accessor :name, :code

    def self.find(code:)
      record = CF_COUNTRIES.find { |country| country[:code] == code }

      new(record[:code], record[:name])
    end

    def initialize(code, name)
      self.code = code
      self.name = name
    end
  end
end
