# frozen_string_literal: true

RSpec.describe Validators::YNAB4Row do
  let(:ynab4_row) { described_class }

  context 'when a row has no Date value' do
    let(:row) { ['', 'Test Payee', '', 1337.0] }

    it 'is invalid' do
      expect(ynab4_row.valid?(row)).to eq(false)
    end
  end

  context 'when a :flows row has no {In,Out}flow values' do
    let(:row) { [Date.parse('2022/03/08'), 'Test Payee', '', '', ''] }

    it 'is invalid' do
      actual = ynab4_row.valid?(row)
      expected = false

      expect(actual).to eq(expected)
    end
  end

  context 'when a :flows row has an Inflow value' do
    let(:row) { [Date.parse('2022/03/08'), 'Test Payee', '', '', 666.0] }

    it 'is valid' do
      actual = ynab4_row.valid?(row)
      expected = true

      expect(actual).to eq(expected)
    end
  end

  context 'when a :flows row has an Outflow value' do
    let(:row) { [Date.parse('2022/03/08'), 'Test Payee', '', 666.0, ''] }

    it 'is valid' do
      actual = ynab4_row.valid?(row)
      expected = true

      expect(actual).to eq(expected)
    end
  end

  context 'when an :amounts row has no Amount value' do
    let(:row) { [Date.parse('2022/03/08'), 'Test Payee', '', ''] }

    it 'is invalid' do
      actual = ynab4_row.valid?(row)
      expected = false

      expect(actual).to eq(expected)
    end
  end

  context 'when an :amounts row has an Amount value' do
    let(:row) { [Date.parse('2022/03/08'), 'Test Payee', '', 666.0] }

    it 'is valid' do
      actual = ynab4_row.valid?(row)
      expected = true

      expect(actual).to eq(expected)
    end
  end

  context 'when a row has no Payee' do
    let(:row) { [Date.parse('2022/03/08'), '', '', 666.0] }

    it 'is invalid' do
      actual = ynab4_row.valid?(row)
      expected = false

      expect(actual).to eq(expected)
    end
  end
end
