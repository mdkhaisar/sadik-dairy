class Milk < ApplicationRecord
  belongs_to :customer
  has_many :items

  accepts_nested_attributes_for :items, allow_destroy: true
  def self.ransackable_attributes(auth_object = nil)
    # List the attributes that you want to make searchable
    # while avoiding sensitive information.
    allowlist = %w[customer_id gayathri_200_ml gayathri_500_ml gayathri_1_ltr]

    def self.ransackable_associations(auth_object = nil)
      # List the associations that you want to make searchable.
      # For example, if you have a 'customer' association, you can include it like this:
      ["customer"]
    end
    # Return the allowlist
    allowlist
  end
end
