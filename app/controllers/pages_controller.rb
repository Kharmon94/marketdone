class PagesController < ApplicationController
  

  def about
  end

  def contact

  end

  def terms
  end

  def countdown
  end

  def home
  	@products = Product.all.order("sold DESC").page(params[:page]).take(4)
  end

  	private

     	def set_product
      		@product = Product.find_by_id(params[:id])
    	end

end
