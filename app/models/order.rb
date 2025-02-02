class Order < ApplicationRecord
  belongs_to :user
  has_one :subject, class_name: "OrderSubject", dependent: :nullify
  has_one :type, class_name: "OrderType", dependent: :nullify
  has_many_attached :files

  validates :subject, presence: true
  validates :type, presence: true
  validates :deadline, presence: true

end
