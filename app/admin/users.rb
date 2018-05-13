ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
	# has_many :businesses
	# has_many :products
	# has_many :reviews
	permit_params :name, :email, :username, :first_name, :last_name, :street_address, :city, :zipcode, :birthday, :bio
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
