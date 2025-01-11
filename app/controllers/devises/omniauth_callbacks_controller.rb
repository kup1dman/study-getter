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
      auth = request.env["omniauth.auth"]
      @user = User.find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
        user.email = github_email(auth.credentials.token) if auth.info.email.blank?
        user.password = Devise.friendly_token[0, 20]
        user.name = auth.info.name
      end

      @user.persisted? ? sign_in_and_redirect(@user) : redirect_to(new_user_registration_url)
    end

    def google_oauth2
      auth = request.env["omniauth.auth"]
      @user = User.find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
        user.name = auth.info.name
      end

      @user.persisted? ? sign_in_and_redirect(@user) : redirect_to(new_user_registration_url)
    end

    def failure
      redirect_to root_path
    end

    def github_email(token)
      uri = URI.parse("https://api.github.com/user/emails")
      request = Net::HTTP::Get.new(uri)
      request["Accept"] = "application/vnd.github+json"
      request["Authorization"] = "Bearer #{token}"
      request["X-Github-Api-Version"] = "2022-11-28"

      JSON.parse(Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == "https").request(request).body).first["email"]
    end
  end
end
