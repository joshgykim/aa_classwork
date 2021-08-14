# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.create([
  {birth_date: '2015-01-30', color: 'Orange', name: 'Garfield', sex: 'M', description: 'lazy'},
  {birth_date: '2017-05-12', color: 'Red', name: 'Clifford', sex: 'M', description: 'big'},
  {birth_date: '2016-10-30', color: 'White', name: 'Snoppy', sex: 'M', description: 'Playful'}
])