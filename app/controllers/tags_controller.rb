class TagsController < ApplicationController
  before_action :set_tag, only: [:show]
    # GET /categories
  # GET /categories.json

  # GET /categories/1
  # GET /categories/1.json
  def index
    @tags = Tag.all
  end

  def show
    @title = Tag.name
    @tags = Tag.all
    @products = @tag.products
  end

  # GET /categories/new
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find_by(params[:name])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:tag).permit(:name)
    end
end
