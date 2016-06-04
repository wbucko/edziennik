ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

	index do
	  column :email
	  column :sign_in_count
	  column :profile
	  column :last_sign_in_ip
	  column :created_at
	  column :updated_at
	  actions
	end

	filter :sign_in_count
	filter :last_sign_in_at
	
end
