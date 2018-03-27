class BusinessCategoriesController < ApplicationController
  before_action :set_business_category, only: [:show]
    # GET /categories
  # GET /categories.json
  def index
    @business_categories = Business_category.all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @title = Business_category.name
    @businesses = @business_category.businesses
  end

  # GET /categories/new
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business_category
      @business_category = Business_category.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:business_category).permit(:name)
    end
end
