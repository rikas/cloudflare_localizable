require 'cloudflare_localizable/country_list'

module CloudflareLocalizable
  class Country
    attr_accessor :name, :code

    def self.find(code:)
      record = CF_COUNTRIES.select { |country| country[:code] == code }.first

      new(record[:code], record[:name])
    end

    def initialize(code, name)
      self.code = code
      self.name = name
    end
  end
end
