class Order < ApplicationRecord
  belongs_to :user
  has_one :subject, dependent: :nullify
  has_one :type, dependent: :nullify
  has_one :group, dependent: :nullify
  belongs_to :desired_executor, class_name: "User", foreign_key: "executor_id", optional: true
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
