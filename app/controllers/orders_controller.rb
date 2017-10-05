class OrdersController < ApplicationController
  before_action :authenticate_user!

  load_resource only: :show

  # GET /orders
  # GET /orders.json
  def index
    @orders = current_user.orders
    @orders = filter_by_status
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    if current_user.orders.exists?(id: params[:id])
      @shipping_a = @order.shipping_address
      @billing_a = @order.billing_address
      @delivery = @order.delivery
      @payment = @order.payment
      @order_items = @order.order_items
      render 'show'
    else
      redirect_to orders_path
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.fetch(:order, {}).permit(:status)
  end

  def filter_by_status
    if params[:status]
      status = params[:status]
      status_id = OrderStatus.find_by(status: status).id
      @orders.where("order_status_id = #{status_id}")
    else
      @orders
    end
  end
end
