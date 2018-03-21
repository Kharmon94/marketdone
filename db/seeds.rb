# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

	Category.destroy_all
	
	
	categories = Category.create([
		{ name: 'Appliances' }, 
		{ name: 'Arts, Crafts, Sewing' },
		{ name: 'Automotive' },
		{ name: 'Baby' },
		{ name: 'Beauty & Personal Care' },
		{ name: 'Books' },
		{ name: 'Music' },
		{ name: 'Movies, Film, Visual Art'},
		{ name: 'Clothing, Shoes & Accessories' },
		{ name: 'Collectibles' },
		{ name: 'Electronics' },
		{ name: 'Children, Toys, Hobbies' },
		{ name: 'Home & Garden' },
		{ name: 'Jewelery' },
		{ name: 'Music Instruments & Gear' },
		{ name: 'Pets' },
		{ name: 'Pottey, Glass' },
		{ name: 'Sporting Goods' },
		{ name: 'Misc (Everything else)' }




		])
	