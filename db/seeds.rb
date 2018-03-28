# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

	# Category.destroy_all
	# State.destroy_all

	business_categories = BusinessCategory.create([
		{ name: 'Active Life' },
		{ name: 'Arts & Entertainment' },
		{ name: 'Automotive' },
		{ name: 'Beauty & Spas' },
		{ name: 'Education' },
		{ name: 'Event Planning & Services' },
		{ name: 'Financial Services' },
		{ name: 'Food & Catering' },
		{ name: 'Baking & Pastry' },
		{ name: 'Restaurants' },
		{ name: 'Health & Medical' },
		{ name: 'Home Services' },
		{ name: 'Hotels & Travel' },
		{ name: 'Local Events' },
		{ name: 'Local Services' },
		{ name: 'Media' },
		{ name: 'Nightlife' },
		{ name: 'Pets' },
		{ name: 'Professional Services' },
		{ name: 'Public Services & Government' },
		{ name: 'Real Estate' },
		{ name: 'Religious Organizations' },
		{ name: 'Shopping' }

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

	states = State.create([
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
	