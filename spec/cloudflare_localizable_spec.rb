require 'spec_helper'

describe CloudFlareLocalizable do
  class MockController < ActionController::Base
    include CloudFlareLocalizable

    def initialize(country_code: nil)
      @country_code = country_code
    end

    def request
      headers = {}
      headers.merge!('HTTP_CF_IPCOUNTRY' => @country_code) if @country_code

      OpenStruct.new(headers: headers)
    end
  end

  it 'has a version number' do
    expect(CloudFlareLocalizable::VERSION).not_to be nil
  end

  it 'adds the helper method cf_country when included' do
    expect(MockController.new).to respond_to(:cf_country)
  end

  it 'returns Unknown country when no header is sent' do
    controller = MockController.new

    expect(controller.cf_country.name).to eq('Unknown')
    expect(controller.cf_country.code).to eq('XX')
  end

  it 'returns Unknown country if the country code is "XX"' do
    controller = MockController.new(country_code: 'XX')

    expect(controller.cf_country.name).to eq('Unknown')
    expect(controller.cf_country.code).to eq('XX')
  end

  it 'returns the correct country information' do
    controller = MockController.new(country_code: 'BB')

    expect(controller.cf_country.name).to eq('Barbados')
    expect(controller.cf_country.code).to eq('BB')

    controller = MockController.new(country_code: 'PT')

    expect(controller.cf_country.name).to eq('Portugal')
    expect(controller.cf_country.code).to eq('PT')
  end
end
