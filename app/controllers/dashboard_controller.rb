class DashboardController < ApplicationController
  def index
    @user = Current.user
  end

  def store
    @user = Current.user
    @store = Store.find(params[:store_id])
    @visit = @store.visits.build
    @visits = @store.visits.order(created_at: :desc).limit(5)
  end
end
