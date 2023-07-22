class Item < ApplicationRecord
  belongs_to :milk

  def self.ransackable_attributes(auth_object = nil)
    # List the attributes that you want to make searchable
    # while avoiding sensitive information.
    allowlist = %w[name]

    # Return the allowlist
    allowlist
  end
end
