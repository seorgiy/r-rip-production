ActiveAdmin.register AdminRating do
  menu label: "Оценки"
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :felix_admin_id, :rate, :comment, :post_date
  #
  # or
  #
  # permit_params do
  #   permitted = [:felix_admin_id, :rate, :comment, :post_date]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
