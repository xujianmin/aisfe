class ClerksController < ApplicationController
  before_action :set_clerk, only: %i[ show edit update destroy ]

  # GET /clerks or /clerks.json
  def index
    @clerks = Clerk.all
  end

  # GET /clerks/1 or /clerks/1.json
  def show
  end

  # GET /clerks/new
  def new
    @clerk = Clerk.new
    @clerk.store_id = params[:store_id]
  end

  # GET /clerks/1/edit
  def edit
  end

  # POST /clerks or /clerks.json
  def create
    @clerk = Clerk.new(clerk_params)

    respond_to do |format|
      if @clerk.save
        format.html { redirect_to store_url(@clerk.store), notice: "Clerk was successfully created." }
        format.json { render :show, status: :created, location: @clerk }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @clerk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clerks/1 or /clerks/1.json
  def update
    respond_to do |format|
      if @clerk.update(clerk_params)
        format.html { redirect_to @clerk, notice: "Clerk was successfully updated." }
        format.json { render :show, status: :ok, location: @clerk }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @clerk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clerks/1 or /clerks/1.json
  def destroy
    @clerk.destroy!

    respond_to do |format|
      format.html { redirect_to clerks_path, status: :see_other, notice: "Clerk was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clerk
      @clerk = Clerk.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def clerk_params
      params.expect(clerk: [ :first_name, :last_name, :gender, :remark, :store_id, :customer_preference ])
    end
end
