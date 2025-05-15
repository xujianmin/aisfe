class InlineEditsController < ApplicationController
  def update
    case params[:resource_type]
    when "clerk"
      @clerk = Clerk.find(params[:id])
      if @clerk.update(clerk_params)
        render turbo_stream: turbo_stream.replace(
          "clerk_#{@clerk.id}",
          partial: "clerks/clerk",
          locals: { clerk: @clerk, index: params[:index].to_i }
        )
      else
        render turbo_stream: turbo_stream.replace(
          dom_id(@clerk),
          partial: "clerks/clerk",
          locals: { clerk: @clerk, index: params[:index].to_i }
        )
      end
    when "stock"
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
    # 其他资源类型
    else
      head :bad_request
    end
  end

  private

  def clerk_params
    params.require(:clerk).permit(:first_name, :last_name, :gender, :remark, :store_id, :customer_preference, :resigned)
  end

  def stock_params
    params.require(:stock).permit(:quantity, :distribution_quantity)
  end
end
