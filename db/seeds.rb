# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

Category.create!(
  [
    {name: '英語', is_invalid: false},
    {name: '数学', is_invalid: false},
    {name: '国語', is_invalid: false},
    {name: '理科', is_invalid: false},
    {name: '地理歴史', is_invalid: false},
    {name: '公民', is_invalid: false},
    {name: 'モチベーションアップコンテンツ', is_invalid: false},
    {name: 'その他', is_invalid: false},
  ]
)
