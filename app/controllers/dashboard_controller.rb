class DashboardController < ApplicationController
  def index
    @user = Current.user
  end

  def store
    @user = Current.user
    @store = Store.find(params[:store_id])
  end
end
