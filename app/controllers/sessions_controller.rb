class SessionsController < Devise::SessionsController
  def after_sign_in_path_for(user)
    case user.role
    when 'admin'
      admins_root_path
    when 'executor'
      executors_root_path
    when 'client'
      clients_root_path
    else
      stored_location_for(user) || super
    end
  end
end
