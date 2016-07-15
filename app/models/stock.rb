class Stock < ApplicationRecord
  class << self
    def new_from_lookup(symbol)
      look_up = StockQuote::Stock.quote(symbol)
      return nil unless look_up.name

      stock = new(ticker: look_up.symbol, name: look_up.name)
      stock.last_price = stock.price
      stock
    end

    #todo: remember how to define finder methods
    def find_by_ticker(symbol)
      where(ticker: symbol).first
    end
  end

  def price
    closing_price = StockQuote::Stock.quote(ticker).close
    return "#{closing_price} (CLOSING)" if closing_price

    (opening_price = StockQuote::Stock.quote(ticker).open) ? "#{opening_price} (OPENING)" : 'Unavailable'
  end
end
