class StockChangeLogsController < ApplicationController
  def index
    @stock = Stock.find(params[:stock_id])
    @logs= @stock.stock_change_logs.includes(:user).order(created_at: :desc)
  end
end
