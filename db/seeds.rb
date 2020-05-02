# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
(1..50).each do |number|
  Request.create(title: 'test title ' + number.to_s, content: 'test content ' + number.to_s, online_or_offline: "0", user_id: "1", money: number.to_s)
  Request.create(title: 'test title ' + number.to_s, content: 'test content ' + number.to_s, online_or_offline: "1", user_id: "1", prefecture: "埼玉県さいたま市", station: "大宮駅", money: number.to_s)
end