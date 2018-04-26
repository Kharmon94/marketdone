class BusinessesController < ApplicationController
  before_action :set_business, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :create]
  has_scope :by_business_category_id, type: :array

  # GET /businesses
  # GET /businesses.json
  def index
      @w = Business.search(params[:w])
      @search = Business.search(params[:w])
      @businesses = @search.result.paginate(:page => params[:page], :per_page => 20).order('created_at DESC')
      @business_categories = BusinessCategory.all.paginate(:page => params[:page], :per_page => 20).order('created_at DESC')
      @businesses = @businesses.where(business_category: params["business_category"]) if params["business_category"].present?
      @businesses = @businesses.where(state: params["state"]) if params["state"].present?
  end

  # GET /businesses/1
  # GET /businesses/1.json
  def show
    @states = State.all.map{|s| [ s.name, s.id ] }
  end

  # GET /businesses/new
  def new
    if current_user.businesses.empty?
      if current_user.subscribed? 
          @business = Business.new
          @states = State.all.map{|s| [ s.name, s.id ] }
          @business_categories = BusinessCategory.all.map{|s| [ s.name, s.id ] }
      else
        redirect_to new_subscriber_path
      end
    else
      redirect_to user_path(current_user)
    end
  end

  # GET /businesses/1/edit
  def edit
    @states = State.all.map{|s| [ s.name, s.id ] }
    @business_categories = BusinessCategory.all.map{|s| [ s.name, s.id ] }
  end

  # POST /businesses
  # POST /businesses.json
  def create
    @business = Business.new(business_params)
    @business.user = current_user
    @business.state_id = params[:state_id]
    @business.business_category_id = params[:business_category_id]
    @states = State.all.map{|s| [ s.name, s.id ] }
    @business_categories = BusinessCategory.all.map{|s| [ s.name, s.id ] }
    current_user.business_created = true

    respond_to do |format|
      if @business.save
        format.html { redirect_to @business, notice: 'Business was successfully created.' }
        format.json { render :show, status: :created, location: @business }
      else
        format.html { render :new }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /businesses/1
  # PATCH/PUT /businesses/1.json
  def update
    @business.state_id = params[:state_id] 
    @business.business_category_id = params[:business_category_id] 

    respond_to do |format|
      if @business.update(business_params)
        format.html { redirect_to @business, notice: 'Business was successfully updated.' }
        format.json { render :show, status: :ok, location: @business }
      else
        format.html { render :edit }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /businesses/1
  # DELETE /businesses/1.json
  def destroy
    @business.destroy
    respond_to do |format|
      format.html { redirect_to businesses_url, notice: 'Business was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business
      @business = Business.find_by_id(params[:id])
    end

    def set_business_category
        @business.business_category_id = params[:business_category_id]
    end

    def set_state
        @business.state_id = params[:state_id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def business_params
      params.require(:business).permit( :title, :description, :address, :city, :email, :hours, :number, :state_id, :business_category_id, :image )
    end
end
