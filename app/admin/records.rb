ActiveAdmin.register Record do
  #
  # permit_params :customer_id, :milk_total
  #
  # or
  #
  # permit_params do
  #   permitted = [:customer_id, :milk_total]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :date, :quantity, :customer_id, milks_attributes: [:id, :milk_name, :quantity, :unit_price, :_destroy]

  filter :customer


  form do |f|
    f.inputs do
      # f.input :name
      f.input :customer_id, as: :select, collection: Customer.all.map { |c| [c.name, c.id] }, include_blank: 'Select Customer'
    end

    f.inputs 'Records' do
      f.has_many :records, heading: 'Records', allow_destroy: true, new_record: 'Add Record' do |rf|
        rf.input :milk_total

        #rf.object.milks.build if rf.object.new_record?
        #rf.inputs 'Milks' do
        #  rf.has_many :milks, heading: 'Milks', allow_destroy: true, new_record: 'Add Milk' do |mf|
        #    mf.input :milk_name
        #    mf.input :quantity
        #    mf.input :unit_price
        #`  end
        #end
      end
    end
    
    f.actions
  end  
end
