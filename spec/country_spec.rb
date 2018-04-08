# frozen_string_literal: true

describe CloudFlareLocalizable::Country do
  describe '.find' do
    it 'returns a new country for the given code' do
      country = described_class.find('BB')

      expect(country.name).to eq('Barbados')
      expect(country.code).to eq('BB')
    end

    it 'returns a "XX" country when the code is "XX"' do
      country = described_class.find('XX')

      expect(country.name).to eq('Unknown')
      expect(country.code).to eq('XX')
    end

    it 'returns a "XX" country when the code is not found' do
      country = described_class.find('ABCD')

      expect(country.name).to eq('Unknown')
      expect(country.code).to eq('XX')
    end
  end
end
