module Client
  class OrdersController < ApplicationController
    before_action :authenticate_user!
    def index
      @orders = current_user.orders.all
    end

    def new
      @order = Order.new
    end

    def create
      @order = Order.new(order_params)
      if @order.save
        redirect_to client_orders_path
      else
        render :new, status: :unprocessable_entity
      end
    end
  end
end
