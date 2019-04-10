RSpec.describe TeamMakerIntegrations::Request do
	describe '#get' do
		describe 'with a valid URL' do
			it 'returns the content' do
				expect(described_class.get('https://www.google.com')).not_to be ''
			end
		end
	end
end
