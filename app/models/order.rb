class Order < ApplicationRecord
  belongs_to :user
  has_many_attached :files

  SUBJECTS = {
    1 => 'КПО',
    2 => 'ОАиП',
    3 => 'ЛАиГ'
  }

  TYPES = {
    1 => 'Контрольная',
    2 => 'Курсовая',
    3 => 'Лабораторная'
  }
end
