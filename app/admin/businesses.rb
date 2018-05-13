ActiveAdmin.register Business do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
	# menu false
	
	# navigation_menu :default
	permit_params :title, :user_id, :description, :address, :city, :email, :hours, :number, :state_id, :business_category_id, :image 
	# belongs_to :user
	form do |f|
	  f.inputs do
	    f.input :user_id, :label => 'User', :as => :select, :collection => User.all.map{|u| ["#{u.username}", u.id]}
	    f.input :title
	    f.input :description
	    f.input :address
	    f.input :city
	    f.input :email
	    f.input :hours
	    f.input :number
	    f.input :state_id, :label => 'State', :as => :select, :collection => State.all.map{|u| ["#{u.name}", u.id]}
	    f.input :business_category_id, :label => 'Category', :as => :select, :collection => BusinessCategory.all.map{|u| ["#{u.name}", u.id]}
	    f.input :image, required: true, as: :file
	  end
	  f.actions
	end
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
