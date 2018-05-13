ActiveAdmin.register Review do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
	# menu false
	# belongs_to :user
	# navigation_menu :default

	permit_params :user_id, :product_id, :rating, :comment

	form do |f|
	  f.inputs do
	    f.input :user_id, :label => 'User', :as => :select, :collection => User.all.map{|u| ["#{u.username}", u.id]}
	   	f.input :product_id, :label => 'Product', :as => :select, :collection => Product.all.map{|u| ["#{u.title}", u.id]}
	   	f.input :rating,  :as => :select, :collection => [1, 2, 3, 4, 5]
	   	f.input :comment
	  end
	  f.actions
	end


#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
