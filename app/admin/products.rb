ActiveAdmin.register Product do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
	# menu false
	# belongs_to :user
	# navigation_menu :default
	permit_params :title, :user_id, :description, :price, :color, :shipping_cost, :size, :sold, :condition, :category_id, :all_tags, :image, :quantity

	form do |f|
	  f.inputs do
	    f.input :user_id, :label => 'User', :as => :select, :collection => User.all.map{|u| ["#{u.username}", u.id]}
	    f.input :title
	    f.input :description
	    f.input :price
	    f.input :color
	    f.input :shipping_cost
	    f.input :size, :as => :select, :collection => ["Infant","XS", "S", "M", "L", "XL", "XXL", "XXXL"]
	    f.input :all_tags
	    f.input :condition, :as => :select, :collection => ["New", "Fair", "Old", "Antique"]
	    f.input :category_id, :label => 'Category', :as => :select, :collection => Category.all.map{|u| ["#{u.name}", u.id]}
	    f.input :image, required: true, as: :file
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
