# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


def rand_id
  rand(1..100_000)
end

ActiveRecord::Base.transaction do
  User.delete_all
  Restaurant.delete_all
  Cart.delete_all
  Dish.delete_all
  Review.delete_all
  CartItem.delete_all

  randy = User.create(
    id: rand_id,
    username: "randy",
    password: "bobandy"
  )

  donald = User.create(
    id: rand_id,
    username: "donald",
    password: "mcronald"
  )

  burgers = Restaurant.create(
    id: rand_id,
    name: "Bobandys Burgers",
    address: "1991 Sunnyvale blvd",
    owner_id: randy.id
  )

  other_rest = Restaurant.create(
    id: rand_id,
    name: "McRonalds",
    address: "86 Hachiroku dr",
    owner_id: donald.id
  )

  cart = Cart.create(
    id: rand_id,
    user_id: randy.id
  )

  dish = Dish.create(
    id: rand_id,
    name: "Burrito Burger",
    description: "A burrito but also a burger",
    restaurant_id: burgers.id
  )

  review1 = Review.create(
    id: rand_id,
    body: "Best restaurant in Nova Scotia.",
    rating: 5,
    user_id: donald.id,
    restaurant_id: burgers.id
  )

  review2 = Review.create(
    id: rand_id,
    body: "I got sick from eating here.",
    rating: 1,
    user_id: randy.id,
    restaurant_id: other_rest.id
  )

  cart_item = CartItem.create(
    id: rand_id,
    cart_id: cart.id,
    dish_id: dish.id
  )

end