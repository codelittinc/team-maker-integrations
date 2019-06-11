# frozen_string_literal: true

RSpec.describe TeamMakerIntegrations::Request do
  describe '#get' do
    context 'with a valid URL' do
      it 'returns the content' do
        VCR.use_cassette('request') do
          expect(described_class.get('https://www.google.com')).not_to be ''
        end
      end
    end
  end
end
