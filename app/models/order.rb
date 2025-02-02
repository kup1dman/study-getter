class Order < ApplicationRecord
  belongs_to :user
  has_one :subject, class_name: "OrderSubject", dependent: :nullify
  has_one :type, class_name: "OrderType", dependent: :nullify
  has_many_attached :files

  validates :subject, presence: true
  validates :type, presence: true
  validates :deadline, presence: true

  enum :status, {
    pending: 1,
    waiting_for_answer: 2,
    approved: 3,
    checking_payment: 4,
    waiting_for_payment: 5,
    in_process: 6,
    done: 7,
    rejected: 8
  }
end
