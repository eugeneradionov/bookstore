class CartsController < ApplicationController
  authorize_resource

  # GET /cart
  def show
  end

  # POST /cart
  def update
    set_coupon_to_params

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
  def destroy # TODO: not sure we need it
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_coupon_to_params
    coupon = Coupon.find_by(code: params[:cart][:discount])
    if coupon && coupon.active
      params[:cart][:discount] = coupon.discount
      coupon.active = false
      coupon.save
    else
      params[:cart][:discount] = nil
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cart_params
    params.fetch(:cart, {}).permit(:discount)
  end
end
