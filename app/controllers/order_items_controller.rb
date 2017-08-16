class OrderItemsController < ApplicationController
  before_action :set_order_item, only: [:show, :destroy]

  # GET /order_items/1
  # GET /order_items/1.json
  def show
  end

  # POST /order_items
  # POST /order_items.json
  def create
    # book = Book.find(params[:book_id])
    book_id = params[:book_id]
    quantity = params[:order_item] ? params[:order_item][:quantity] : 1
    @order_item = @cart.add_book(book_id, quantity)

    respond_to do |format|
      if @order_item.save
        format.html { redirect_to request.referrer }
        format.js
        format.json { render :show, status: :created, location: @order_item }
      else
        format.html
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_items/1
  # DELETE /order_items/1.json
  def destroy
    @order_item.destroy
    respond_to do |format|
      format.html { redirect_to cart_path, notice: 'Order item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order_item
    @order_item = OrderItem.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_item_params
    params.require(:order_item).permit(:book_id, :quantity)
  end
end
