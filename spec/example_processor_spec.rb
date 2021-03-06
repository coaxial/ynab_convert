# frozen_string_literal: true

RSpec.describe(Processor::Example) do
  context('with any file') do
    before(:context) do
      @subject = Processor::Example.new(
        file: File.join(File.dirname(__FILE__),
                        'fixtures/example/valid.csv')
      )
    end

    it 'instantiates' do
      expect(@subject).to be_an_instance_of(Processor::Example)
    end

    it 'inherits from Processor::Base' do
      expect(@subject).to be_kind_of(Processor::Base)
    end
  end

  context 'with a valid CSV file' do
    before(:context) do
      filename = File.join(File.dirname(__FILE__), 'fixtures/example/valid.csv')
      @subject = Processor::Example.new(file: filename)
    end

    it 'outputs valid YNAB4 CSV data', :writes_csv do
      @subject.to_ynab!
      actual = File.read('valid_example_bank_20191223-20200202_ynab4.csv')
      expected = <<~ROWS
        "Date","Payee","Memo","Outflow","Inflow"
        "23/12/2019","coaxial","","1000000.00",""
        "30/12/2019","santa","","50000.00",""
        "02/02/2020","someone else","","45.00",""
      ROWS

      expect(actual).to eq(expected)
    end
  end
end
