module Client
  class OrdersController < ApplicationController
    before_action :authenticate_user!
    def index
      @orders = current_user.orders
    end

    def new
      @order = current_user.orders.new
    end

    def create
      @order = current_user.orders.new(order_params.except(:group, :desired_executor).merge(
        subject: OrderSubject.find_by(id: params.dig(:order, :subject)),
        type: OrderType.find_by(id: params.dig(:order, :type))
        )
      )
      current_user.desired_executor = User.find_by(id: params.dig(:order, :desired_executor))
      current_user.group = UserGroup.find_by(id: params.dig(:order, :group))
      if @order.valid? & current_user.valid?
        @order.save
        current_user.save if current_user.changed?
        redirect_to client_orders_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    private

    def order_params
      params.
        require(:order).
        permit(:subject, :type, :deadline, :title, :group, :desired_executor, :files, :volume_from, :volume_to, :comment)
    end
  end
end
