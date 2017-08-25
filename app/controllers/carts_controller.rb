class CartsController < ApplicationController
  authorize_resource
  # GET /cart
  def show
  end

  # POST /cart
  # POST /cart.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST cart/1
  def update
    coupon = Coupon.find_by(code: params[:cart][:discount])
    if coupon && coupon.active
      params[:cart][:discount] = coupon.discount
      coupon.active = false
      coupon.save
    else
      params[:cart][:discount] = nil
    end

    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to cart_path, notice: 'Book was successfully updated.' }
      else
        format.html { redirect_to cart_path, notice: '' }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cart/1
  # DELETE /cart/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def cart_params
    params.fetch(:cart, {}).permit(:discount)
  end
end
