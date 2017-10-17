class OrdersController < ApplicationController
  before_action :authenticate_user!

  load_resource only: :show

  # GET /orders
  def index
    @orders = current_user.orders
    @orders = filter_by_status
  end

  # GET /orders/1
  def show
    redirect_to orders_path unless current_user.orders.exists?(id: params[:id])
  end

  private

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
