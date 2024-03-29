# frozen_string_literal: true

module Transformers
  module Enhancers
    # An Enhancer parses YNAB4 rows (Date, Payee, Memo, Amount or Inflow and
    # Outflow) and augments the data therein.
    # A typical case would be converting from one currency to the user's YNAB
    # base currency when the Statement is in a different currency (see
    # n26_enhancer.rb for an example)
    class Enhancer
      def initialize; end

      # @param _row [CSV::Row] The row to enhance
      # @return [CSV::Row] The enhanced row
      def run(_row)
        raise NotImplementedError, :run
      end
    end
  end
end
