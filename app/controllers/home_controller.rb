class HomeController < ApplicationController
  def index
    return redirect_to admins_root_path if current_user&.admin?
    return redirect_to executors_root_path if current_user&.executor?
    return redirect_to clients_root_path if current_user&.client?
    render :index
  end
end
