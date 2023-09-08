ActiveAdmin.register Milk do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params  :milk_name, :quantity, :unit_price, :total_price, :customers_id
  
  filter :milk_name
  # or
  #
  # permit_params do
  #   permitted = [:gayathri_200_ml, :gayathri_500_ml, :gayathri_1_ltr]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
