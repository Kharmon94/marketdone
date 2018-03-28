class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :current, :index]

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @products = Product.where(user: current_user).order("created_at DESC")
    @businesses = Business.where(user: current_user).order("created_at DESC")
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  def current
    @profile = current_user.profile
    @products = Product.all
    @businesses = Business.all
    if @profile.nil?
      new
      render 'new'
    else
      render 'show'
    end
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    UserMailer.welcome_email(@profile.user).deliver_later

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json


  # def connect_stripe

  #   response = HTTParty.post("https://connect.stripe.com/oauth/token",
  #       :query => { client_secret: ENV['STRIPE_SECRET_KEY'],
  #                   code: params[:code],
  #                   grant_type: "authorization_code"
  #                 })

  #   current_user.stripe_id = response.parsed_response['stripe_id']
  #   current_user.save

  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:user_id, :username, :first_name, :last_name, :street_address, :city, :state, :zipcode, :bio, :avatar)
    end
end
