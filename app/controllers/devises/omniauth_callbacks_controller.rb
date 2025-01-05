module Devises
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    skip_before_action :verify_authenticity_token, only: [:github, :google_oauth2]
    def telegram
      @user = User.find_or_create_by(provider: :telegram, uid: params[:id]) do |user|
        user.name = params[:first_name]
        user.password = Devise.friendly_token[0, 20]
      end
      @user.persisted? ? sign_in_and_redirect(@user) : redirect_to(new_user_registration_url)
    end

    def github
      redirect_to root_path
    end

    def google_oauth2
      redirect_to root_path
    end

    def failure
      redirect_to root_path
    end
  end
end
