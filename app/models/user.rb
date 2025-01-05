class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :validatable, :omniauthable, omniauth_providers: %i[github google_oauth2]

  validates :role, presence: true

  enum :role, { client: 1, executor: 2, admin: 3 }

  def email_required?
    false if self.provider == 'telegram'
  end
end
