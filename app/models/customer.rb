class Customer < ApplicationRecord
  has_many :milks, dependent: :destroy
  has_many :items, through: :milks
  accepts_nested_attributes_for :milks, allow_destroy: true
  accepts_nested_attributes_for :items, allow_destroy: true

  before_save :update_data

  def update_data
    milk_total = 0
    product_total = 0
    paid_amount = 0
    balance = 0
    puts "Milks: #{self.milks}"
    self.milks.each do |milk|
      milk_total += milk.quantity * milk.unit_price
      milk.total_price = milk_total
      # milk.save
    end
    self.milk_total = milk_total
    self.product_total = product_total
    self.total_amount = milk_total + product_total

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
      ["milks"]
    end

    # Return the allowlist
    allowlist
  end
end
