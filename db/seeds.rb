# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
now = DateTime.now
yesterday = DateTime.yesterday


Comment.delete_all
Flat.delete_all
Scrap.delete_all
User.delete_all

user1   = User.create!  :email => 'john@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret', :last_sign_in_at => yesterday
user2 = User.create! :email => 'patres2@gmail.com', :password => 'aaaaaaaa', :password_confirmation => 'aaaaaaaa', :last_sign_in_at => yesterday


scrap1 = Scrap.create! city: "Kosice", part_of_town: "KVP", room_count: 3, keywords: "balkon",
                       price_min: 50000, price_max: 80000, last_search_time: DateTime.now, time_of_result_expiration: now

scrap2 = Scrap.create! city: "Kosice", part_of_town: "Terasa", room_count: 2, keywords: "balkon",
                       price_min: 40000, price_max: 60000, last_search_time: DateTime.yesterday, time_of_result_expiration: yesterday

flat1 = Flat.create! name: "bytik1", content: "toto je concent", price: 90000, date_of_scrap: now,
                     room: 3, date_of_creation: DateTime.now, scrap_id: scrap1.id

flat2 = Flat.create! name: "bytik2", content: "toto je concent", price: 60000, date_of_scrap: yesterday,
                     room: 2, date_of_creation: yesterday, scrap_id: scrap2.id

flat3 = Flat.create! name: "bytik2", content: "toto je concent", price: 70000, date_of_scrap: yesterday,
                     room: 2, date_of_creation: yesterday, scrap_id: scrap2.id

flat4 = Flat.create! name: "bytik2", content: "toto je concent", price: 90044, date_of_scrap: yesterday,
                     room: 2, date_of_creation: yesterday, scrap_id: scrap1.id

comment1 = Comment.create! content: "spokojny", date_of_creation: yesterday, user_id: user1.id, flat_id: flat1.id
comment2 = Comment.create! content: "ujde", date_of_creation: yesterday, user_id: user1.id, flat_id: flat1.id
comment3 = Comment.create! content: "nespokojny", date_of_creation: yesterday, user_id: user2.id, flat_id: flat1.id
comment4 = Comment.create! content: "ok", date_of_creation: yesterday, user_id: user1.id, flat_id: flat2.id
comment5 = Comment.create! content: "moza", date_of_creation: yesterday, user_id: user2.id, flat_id: flat2.id

