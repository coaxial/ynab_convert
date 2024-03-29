# frozen_string_literal: true

require 'ynab_convert/api_clients/api_client'

RSpec.describe APIClients::APIClient, :vcr do
  let(:api_client) do
    described_class.new(api_base_path: 'https://example.org/api')
  end

  it 'instantiates' do
    expect(api_client).to be_an_instance_of(described_class)
  end
end
