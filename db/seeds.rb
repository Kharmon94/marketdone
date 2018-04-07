# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

	# Category.destroy_all
	# State.destroy_all
	# BusinessCategory.destroy_all

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
		{ name: 'Alabama, AL'},
		{ name: 'Alaska, AK'},
		{ name: 'Arizona, AZ'},
		{ name: 'Arkansas, AR'},
		{ name: 'California, CA'},
		{ name: 'Colorado, CO'},
		{ name: 'Connecticut, CT'},
		{ name: 'Delaware, DE'},
		{ name: 'District of Columbia, DC'},
		{ name: 'Florida, FL'},
		{ name: 'Georgia, GA'},
		{ name: 'Hawaii, HI'},
		{ name: 'Idaho, ID'},
		{ name: 'Illinois, IL'},
		{ name: 'Indiana, IN'},
		{ name: 'Iowa, IA'},
		{ name: 'Kansas, KS'},
		{ name: 'Kentucky, KY'},
		{ name: 'Louisiana, LA'},
		{ name: 'Maine, ME'},
		{ name: 'Maryland, MD'},
		{ name: 'Massachusetts, MA'},
		{ name: 'Michigan, MI'},
		{ name: 'Minnesota, MN'},
		{ name: 'Mississippi, MS'},
		{ name: 'Missouri, MO'},
		{ name: 'Montana, MT'},
		{ name: 'Nebraska, NE'},
		{ name: 'Nevada, NV'},
		{ name: 'New Hampshire, NH'},
		{ name: 'New Jersey, NJ'},
		{ name: 'New Mexico, NM'},
		{ name: 'New York, NY'},
		{ name: 'North Carolina, NC'},
		{ name: 'North Dakota, ND'},
		{ name: 'Ohio, OH'},
		{ name: 'Oklahoma, OK'},
		{ name: 'Oregon, OR'},
		{ name: 'Pennsylvania, PA'},
		{ name: 'Rhode Island, RI'},
		{ name: 'South Carolina, SC'},
		{ name: 'South Dakota, SD'},
		{ name: 'Tennessee, TN'},
		{ name: 'Texas, TX'},
		{ name: 'Utah, UT'},
		{ name: 'Vermont, VT'},
		{ name: 'Virginia, VA'},
		{ name: 'Washington, WA'},
		{ name: 'West Virginia, WV'},
		{ name: 'Wisconsin, WI'},
		{ name: 'Wyoming, WY'}


	])
	AdminUser.create!(email: 'pharaohnge@gmail.com', password: '@Pharaoh101', password_confirmation: '@Pharaoh101')