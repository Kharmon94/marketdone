class VotesController < ApplicationController
	before_action :find_product
	before_action :find_vote, only: [:destroy]
	before_action :authenticate_user!
	skip_before_action :verify_authenticity_token, :only => [:create, :destroy]

		def create
		  if already_voted?
		    flash[:notice] = "You can't like more than once"
		  else
		    @product.votes.create(user_id: current_user.id)
		  end
		  redirect_to product_path(@product)
		end

		def destroy
		  if !(already_voted?)
		    flash[:notice] = "Cannot unlike"
		  else
		    @like.destroy
		  end
		  redirect_to product_path(@product)
		end

		def find_vote
		   @like = @product.votes.find(params[:id])
		end



	  private

	  def find_product
	    @product = Product.find(params[:product_id])
	  end
end
