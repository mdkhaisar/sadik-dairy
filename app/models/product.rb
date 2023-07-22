class Product < ApplicationRecord
  before_save :update_total
  def self.ransackable_attributes(auth_object = nil)
    # List the attributes that you want to make searchable
    # while avoiding sensitive information.
    allowlist = %w[name quantity unit_price total_price]

    # Return the allowlist
    allowlist
  end

  def update_total
    self.total_price = self.quantity * self.unit_price
  end
end
