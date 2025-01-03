class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[telegram]

  validates :role, presence: true

  enum :role, { client: 1, executor: 2, admin: 3 }
end
