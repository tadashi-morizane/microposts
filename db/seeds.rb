# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#ユーザーの作成
user_a = User.create(name: "user_a", email: "user_a@gmail.com", password: "abcdefgh")
user_b = User.create(name: "user_b", email: "user_b@gmail.com", password: "abcdefgh")
user_c = User.create(name: "user_c", email: "user_c@gmail.com", password: "abcdefgh")

#ユーザーAはBとCをフォロー
#ユーザーBはAをフォロー
#ユーザーCは誰もフォローしてません
Relationship.create(follower_id: user_a.id, followed_id: user_b.id)
Relationship.create(follower_id: user_a.id, followed_id: user_c.id)
Relationship.create(follower_id: user_b.id, followed_id: user_a.id)

#ユーザーAとBの発言を５件ずつ作成
5.times do |no|
  Micropost.create(user_id: user_a.id, content: "UserAの発言#{no}")
  Micropost.create(user_id: user_b.id, content: "UserBの発言#{no}")
end