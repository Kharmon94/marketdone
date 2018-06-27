class ReviewsController < ApplicationController
before_action :authenticate_user!
before_action :find_product


	def new
		@review = Review.new
	end

	def create
		@review = Review.new(review_params)
		@review.product_id = @product.id
		# @review.user = current_user
		@review.user_id = current_user.id
		# @review.user.username = current_user.username


		if @review.save
			redirect_to product_path(@product)
		else
			render 'new'
		end
	end

	def destroy
	    @review.destroy
	    respond_to do |format|
	      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
	      format.json { head :no_content }
    end
  end

	private

		def review_params 
			params.require(:review).permit(:rating, :comment)
		end


		def find_product
			@product = Product.find_by_id(params[:product_id])
		end
end
