class HomeController < ApplicationController
  def index
    return redirect_to admin_orders_path if current_user&.admin?
    return redirect_to executor_orders_path if current_user&.executor?
    return redirect_to client_orders_path if current_user&.client?
    render :index
  end
end
