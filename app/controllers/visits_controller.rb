class VisitsController < ApplicationController
  before_action :set_visit, only: %i[ show edit update destroy ]
  before_action :set_store, only: %i[ index new create ]

  def index
    @visits = @store.visits.order(created_at: :desc)
  end

  def show
  end

  def new
    @visit = @store.visits.build
  end

  def edit
  end

  def create
    @visit = @store.visits.build(visit_params)
    @visit.user = Current.user

    if @visit.save
      redirect_to store_visits_path(@store), notice: "访问记录已创建"
    # elsif controller_name == "visits"
    #   render new_store_visit_path(@store), status: :unprocessable_entity
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @visit.update(visit_params)
      redirect_to store_visits_path(@visit.store), notice: "访问记录已更新"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    store = @visit.store
    @visit.destroy
    redirect_to store_visits_path(store), notice: "访问记录已删除"
  end

  private
    def set_visit
      @visit = Current.user.visits.find(params[:id])
      @store = @visit.store
    end

    def set_store
      @store = Current.user.stores.find(params[:store_id])
    end

    def visit_params
      params.require(:visit).permit(:content)
    end
end
