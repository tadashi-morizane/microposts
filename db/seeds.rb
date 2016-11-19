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
user_d = User.create(name: "user_d", email: "user_d@gmail.com", password: "abcdefgh")
user_e = User.create(name: "user_e", email: "user_e@gmail.com", password: "abcdefgh")
user_f = User.create(name: "user_f", email: "user_f@gmail.com", password: "abcdefgh")
user_g = User.create(name: "user_g", email: "user_g@gmail.com", password: "abcdefgh")
user_h = User.create(name: "user_h", email: "user_h@gmail.com", password: "abcdefgh")
user_i = User.create(name: "user_i", email: "user_i@gmail.com", password: "abcdefgh")

#ユーザーAはB,C,D,E,F,G,Hをフォロー
#ユーザーBはA,,C,D,E,F,Gをフォロー
#ユーザーCは誰もフォローしてません
Relationship.create(follower_id: user_a.id, followed_id: user_b.id)
Relationship.create(follower_id: user_a.id, followed_id: user_c.id)
Relationship.create(follower_id: user_a.id, followed_id: user_d.id)
Relationship.create(follower_id: user_a.id, followed_id: user_e.id)
Relationship.create(follower_id: user_a.id, followed_id: user_f.id)
Relationship.create(follower_id: user_a.id, followed_id: user_g.id)
Relationship.create(follower_id: user_a.id, followed_id: user_h.id)

Relationship.create(follower_id: user_b.id, followed_id: user_c.id)
Relationship.create(follower_id: user_b.id, followed_id: user_d.id)
Relationship.create(follower_id: user_b.id, followed_id: user_e.id)
Relationship.create(follower_id: user_b.id, followed_id: user_f.id)
Relationship.create(follower_id: user_b.id, followed_id: user_g.id)

Relationship.create(follower_id: user_b.id, followed_id: user_a.id)
Relationship.create(follower_id: user_c.id, followed_id: user_a.id)
Relationship.create(follower_id: user_d.id, followed_id: user_a.id)
Relationship.create(follower_id: user_e.id, followed_id: user_a.id)
Relationship.create(follower_id: user_f.id, followed_id: user_a.id)
Relationship.create(follower_id: user_g.id, followed_id: user_a.id)
Relationship.create(follower_id: user_h.id, followed_id: user_a.id)






#ユーザーAとBの発言を５件ずつ作成
7.times do |no|
  Micropost.create(user_id: user_a.id, content: "UserAの発言#{no}")
  Micropost.create(user_id: user_b.id, content: "UserBの発言#{no}")
end

6.times do |no|
  Micropost.create(user_id: user_d.id, content: "UserAの発言#{no}")
  Micropost.create(user_id: user_e.id, content: "UserBの発言#{no}")
  Micropost.create(user_id: user_f.id, content: "UserBの発言#{no}")
  Micropost.create(user_id: user_g.id, content: "UserBの発言#{no}")
  Micropost.create(user_id: user_h.id, content: "UserBの発言#{no}")
end