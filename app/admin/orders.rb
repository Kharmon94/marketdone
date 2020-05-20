ActiveAdmin.register Order do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
	# has_many :businesses
	# has_many :products
	# has_many :reviews
	permit_params :address, :city, :state, :zip, :quantity, :color, :size, :shipping_name, :shipping_last_name, :shipped, :country, :stripeEmail, :stripeToken
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end