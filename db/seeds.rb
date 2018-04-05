# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

	Category.destroy_all
	State.destroy_all
	BusinessCategory.destroy_all

	business_categories = BusinessCategory.create([
		{ name: 'Appliance Installations' },
		{ name: 'Arts & Entertainment' },
		{ name: 'Art Gallery Boutiques' },
		{ name: 'Automotive Services' },
		{ name: 'Beauty & Spas' },
		{ name: 'Business Services' },
		{ name: "Children's Services" },
		{ name: 'Computer & Technology Services' },
		{ name: 'Clothing/Accessories Boutiques' },
		{ name: 'Dry Cleaning & Laundry'},
		{ name: 'Education Services' },
		{ name: 'Event Planning & Services' },
		{ name: 'Financial Services' },
		{ name: 'Food & Catering Services' },
		{ name: 'Baking & Pastry' },
		{ name: 'Restaurants & Cafe Services' },
		{ name: 'Health & Medical Services' },
		{ name: 'Home Improvement Services' },
		{ name: 'Hotels & Travel' },
		{ name: 'Massage Therapy & Acupuncture Services' },
		{ name: 'Modeling Services' },
		{ name: 'Moving & Removal Companies' },
		{ name: 'Media Promotion & Services' },
		{ name: 'Nightlife' },
		{ name: 'Pets' },
		{ name: 'Photography & Videography Services' },
		{ name: 'Physical Fitness Services' },
		{ name: 'Professional Services' },
		{ name: 'Public Services & Government' },
		{ name: 'Real Estate' },
		{ name: 'Spiritual Services' }

	])
	
	
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

	states = State.create!([
		{ name: 'AL'},
		{ name: 'AK'},
		{ name: 'AZ'},
		{ name: 'AR'},
		{ name: 'CA'},
		{ name: 'CO'},
		{ name: 'CT'},
		{ name: 'DE'},
		{ name: 'DC'},
		{ name: 'FL'},
		{ name: 'GA'},
		{ name: 'HI'},
		{ name: 'ID'},
		{ name: 'IL'},
		{ name: 'IN'},
		{ name: 'IA'},
		{ name: 'KS'},
		{ name: 'KY'},
		{ name: 'LA'},
		{ name: 'ME'},
		{ name: 'MD'},
		{ name: 'MA'},
		{ name: 'MI'},
		{ name: 'MN'},
		{ name: 'MS'},
		{ name: 'MO'},
		{ name: 'MT'},
		{ name: 'NE'},
		{ name: 'NV'},
		{ name: 'NH'},
		{ name: 'NJ'},
		{ name: 'NM'},
		{ name: 'NY'},
		{ name: 'NC'},
		{ name: 'ND'},
		{ name: 'OH'},
		{ name: 'OK'},
		{ name: 'OR'},
		{ name: 'PA'},
		{ name: 'RI'},
		{ name: 'SC'},
		{ name: 'SD'},
		{ name: 'TN'},
		{ name: 'TX'},
		{ name: 'UT'},
		{ name: 'VT'},
		{ name: 'VA'},
		{ name: 'WA'},
		{ name: 'WV'},
		{ name: 'WI'},
		{ name: 'WY'}


	])
	AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?