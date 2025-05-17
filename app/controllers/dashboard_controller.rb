class DashboardController < ApplicationController
  def index
    @user = Current.user
  end

  def store
    @user = Current.user
    @store = Store.find(params[:store_id])
    @visits = @store.visits.order(created_at: :desc).limit(5)
    @clerk = Clerk.new(store_id: @store.id)
  end
end
