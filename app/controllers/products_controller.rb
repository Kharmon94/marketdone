class ProductsController < ApplicationController
  before_action :set_product, only: [:create, :show, :edit, :update, :destroy]
  before_action :authenticate_user!, only:[:create, :edit, :update, :destroy, :new]
  load_and_authorize_resource


  # GET /products
  # GET /products.json 

  def index
      @products = Product.search(params[:search]).page(params[:page])
      # @q = Product.search(params[:q])
      # @products = @q.result.order('created_at DESC').page(params[:page])
      @products = @products.where(category: params["category"]) if params["category"].present?
      @products = @products.where("price > ?", params["min_price"]) if params["min_price"].present?
      @products = @products.where("price < ?", params["max_price"]) if params["max_price"].present?
      @categories = Category.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
     @products = Product.search(params[:search]).page(params[:page])
  end

  # GET /products/new
  def new
    if current_user.can_receive_payments?
      @product = Product.new
      @categories = Category.all.map{|c| [ c.name, c.id ] }
      @product.color_variants.build
      @product.size_variants.build
    else
      redirect_to user_path(current_user)
    end
  end

  

  # GET /products/1/edit
  def edit
    @categories = Category.all.map{|c| [ c.name, c.id ] }
   
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @product.user = current_user
    @product.category_id = params[:category_id] 
    # @product.color_variants_attributes = params[:color_variants_attributes => [:id, :color, :product_id, :_destroy, :size_variants_attributes => [:id, :size, :quantity, :_destroy, :color_variant_id ]]]
    
    @categories = Category.all.map{|c| [ c.name, c.id ] }

    

    respond_to do |format|
      if @product.save
        UserMailer.product_email(@product.user).deliver
        format.html { redirect_to @product, notice: 'Thank You For Listing Your Product On The Black Woman Is God Stores' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @product.category_id = params[:category_id]
    @categories = Category.all.map{|c| [ c.name, c.id ] }

     
    
    respond_to do |format|
      if @product.update(product_params)
        UserMailer.product_email(@product.user).deliver
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully deleted.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find_by_id(params[:id])
    end

    def set_category
        @product.category_id = params[:category_id]
    end

    def set_color_variants
      @product.color_variant_id = params[:color_variants_attributes => [:id]]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:user_id, :title, :description, :price, :shipping_cost, :sold, :condition, :category_id, :inventory, :all_tags, :picture, images: [], :color_variants_attributes => [:id, :color, :product_id, :_destroy], :size_variants_attributes => [:id, :size, :product_id, :_destroy])
    end

end
