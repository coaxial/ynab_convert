# frozen_string_literal: true

require 'ynab_convert/transformers/formatters/n26_formatter'

RSpec.describe Transformers::Formatters::N26 do
  let(:statement) do
    options = { col_sep: ',', quote_char: '"', headers: true }
    CSV.read('spec/fixtures/statements/n26.csv', options)
  end
  let(:subject) { Transformers::Formatters::N26.new }

  it 'inherits from Formatters::Formatter' do
    expect(subject).to be_kind_of(Transformers::Formatters::Formatter)
  end

  it 'formats rows' do
    actual = statement.reduce([]) { |acc, row| acc << subject.run(row) }

    expected = [
      ['2022-01-20', 'Amel MaruMaru', 'EUR', '200000.0'],
      ['2022-02-11', 'Hallberg-Rassy', 'EUR', '-120000.0']
    ]

    expect(actual).to eq(expected)
  end
end