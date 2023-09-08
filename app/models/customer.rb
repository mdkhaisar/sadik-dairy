class Customer < ApplicationRecord
  has_many :records, dependent: :destroy
  accepts_nested_attributes_for :records, allow_destroy: true
  before_save :update_data

  def update_data
    milk_total = 0
    product_total = 0
    self.paid_amount = 0 if self.paid_amount == nil
    self.balance = 0 if self.balance == nil
    #puts "Milks: #{self.milks}"
    #self.milks.each do |milk|
     # milk.milk_name = milk.milk_name
      #milk_total += milk.quantity * milk.unit_price
      #milk.total_price = milk_total
      # milk.save
    #end
    self.milk_total = milk_total
    self.product_total = product_total
    self.total_amount = milk_total + product_total
    self.balance = self.total_amount
  end


  def self.ransackable_attributes(auth_object = nil)
    # List the attributes that you want to make searchable
    # while avoiding sensitive information.
    allowlist = %w[name milk_total product_total total_amount paid_amount balance]

    #reflect_on_all_associations(:belongs_to).each do |association|
     # allowlist.concat(association.klass.ransackable_attributes(auth_object))
    #end

    def self.ransackable_associations(auth_object = nil)
      # List the associations that you want to make searchable.
      # For example, if you have a 'milks' association, you can include it like this:
      ["customer"]
    end

    # Return the allowlist
    allowlist
  end
end
