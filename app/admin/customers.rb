ActiveAdmin.register Customer do
  permit_params :name, :milk_total, :product_total, :total_amount, :paid_amount, :balance, milks_attributes: [:id, :item_id, :quantity, :unit_price, :total_price]
  #
  # or
  #
  # permit_params do
  #   permitted = [:name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  filter :name

  form do |f|
    f.inputs do
      f.input :name
    end
    #f.inputs 'Items' do
    #  f.has_many :milks, heading: 'Milks', allow_destroy: true, new_record: 'Add Milk' do |qi|
        # qi.input :items, as: :select, collection: Item.all.map { |p| [p.name, p.id] }, include_blank: 'Select Item'
    #    qi.input :quantity
    #    qi.input :unit_price
    #    qi.input :milk_name  #, as: :select, collection: Milk.milk_name.keys      # qi.input :_destroy, as: :boolean, required: false, label: 'Remove', wrapper_html: { class: 'remove-item' }
    #  end
    # end
    f.actions
  end
   index download_links: [:csv] do
    selectable_column
    id_column
    column :name
    column :milk_total
    column :product_total
    column :total_amount
    column :paid_amount
    column :balance
    actions
   end  

   show do
    attributes_table do
      row :name
      row "Items" do
        panel "Milks" do
          #if customer.records.any?
            table_for customer.records.first.milk do
              column :milk_name
              column :quantity
              column :unit_price
            end
          #else
            #  span "No records found"
          # end
        end
      end
      row :milk_total
      row :product_total
      row :total_amount
      row :paid_amount
      row :balance
    end
   end
end
