class StocksController < ApplicationController
  def search
    if params[:stock]
      # search the db for it
      @stock = Stock.find_by_ticker(params[:stock])
      # if you didn't find it create a new from lookup
      @stock ||= Stock.new_from_lookup(params[:stock])
    end

    if @stock
      # render json: @stock
      render partial: 'lookup'
    else
      render status: :not_found, nothing: true
    end
  end
end