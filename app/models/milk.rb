class Milk < ApplicationRecord
  belongs_to :record

  enum :status, { draft: 0, published: 1, archived: 2, trashed: 3 }
  # accepts_nested_attributes_for :items, allow_destroy: true
  def self.ransackable_attributes(auth_object = nil)
    # List the attributes that you want to make searchable
    # while avoiding sensitive information.
    allowlist = %w[record_id milk_name quantity unit_price total_price]

    def self.ransackable_associations(auth_object = nil)
      # List the associations that you want to make searchable.
      # For example, if you have a 'customer' association, you can include it like this:
      ["record"]
    end
    # Return the allowlist
    allowlist
  end
end
