class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  # GET /products or /products.json
  def index
    @products = Product.all
  end

  def filter
    cat_id = params[:category_id]
    if cat_id != ''
      @products = Product.joins(:categories).where(categories: { id: cat_id }).uniq
      @is_filtered = true
      render :index
    else
      redirect_to action: :index
    end
  end

  # GET /products/1 or /products/1.json
  def show; end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit; end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        attach_placeholder_image unless @product.image.attached?
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:title, :description, :price, :image, category_ids: [])
  end

  def attach_placeholder_image
    @product.image.attach(io: File.open('app/assets/images/placeholder_image.jpg'), filename: 'placeholder_image')
  end
  # useless, because it's implicitly handled by rails (my goodness)
  # def create_cats_prods_associations
  #   cat_ids= product_params[:category_ids]
  #   cat_ids.shift
  #   cat_ids.each do |id|
  #     CatsProdsAssociation.create(category_id: id.to_i, product_id: @product.id)
  #   end
  # end
end
