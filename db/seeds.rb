# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
UserGroup.create(uid: '381570')
UserGroup.create(uid: '381571')
UserGroup.create(uid: '381572')

OrderSubject.create(name: 'КПО')
OrderSubject.create(name: 'ОАиП')
OrderSubject.create(name: 'ЛАиГ')

OrderType.create(name: 'Курсовая')
OrderType.create(name: 'Контрольная')
OrderType.create(name: 'Лабораторная')
OrderType.create(name: 'Практическая')
