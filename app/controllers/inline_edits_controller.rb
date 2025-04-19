class InlineEditsController < ApplicationController
  def update
    @stock = Stock.find(params[:id])
    if @stock.update(stock_params)
      render turbo_stream: turbo_stream.replace(
        "stock_#{@stock.id}",
        partial: "dashboard/drug_table_line_item",
        locals: { stock: @stock }
      )
    else
      # render :edit, status: :unprocessable_entity
      render turbo_stream: turbo_stream.replace(
        "stock_#{@stock.id}",
        partial: "dashboard/drug_table_line_item",
        locals: { stock: @stock }
      )
    end
  end

  private

  def stock_params
    params.require(:stock).permit(:quantity, :distribution_quantity)
  end
end
