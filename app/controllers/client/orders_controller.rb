module Client
  class OrdersController < ApplicationController
    before_action :authenticate_user!, except: [ :new, :create ]
    def index
      @orders = current_user.orders
    end

    def new
      @order = Order.new
    end

    def create
      @order = Order.new(order_params.merge(
        subject: Subject.find_by(id: params.dig(:order, :subject)),
        type: Type.find_by(id: params.dig(:order, :type)),
        group: Group.find_by(id: params.dig(:order, :group)),
        desired_executor: User.find_by(id: params.dig(:order, :desired_executor)),
        )
      )
      if @order.valid?
        @order.save
        if user_signed_in?
          @order.update(user: current_user)
          current_user.group = @order.group
          current_user.desired_executor = @order.desired_executor
          current_user.save if current_user.changed?
          redirect_to client_orders_path
        else
          redirect_to new_user_session_path
        end
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
