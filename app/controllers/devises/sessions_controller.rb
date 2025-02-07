module Devises
  class SessionsController < Devise::SessionsController
    def create
      super
      Order.last.update(user: current_user)
      current_user.group = Order.last.group
      current_user.desired_executor = Order.last.desired_executor
      current_user.save if current_user.changed?
    end
  end
end
