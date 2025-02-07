class User < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_one :group, dependent: :nullify
  belongs_to :desired_executor, class_name: "User", foreign_key: "executor_id", optional: true

  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :validatable, :omniauthable, omniauth_providers: %i[github google_oauth2]

  validates :role, presence: true
  validates :group, presence: true, if: -> { orders.any?(&:new_record?) }

  enum :role, { client: 1, executor: 2, admin: 3 }

  def email_required?
    self.provider == "telegram" ? false : true
  end
end
