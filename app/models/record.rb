class Record < ApplicationRecord
  belongs_to :customer
  has_many :milks, dependent: :destroy
  accepts_nested_attributes_for :milks, allow_destroy: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "customer_id", "id", "milk_total", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["customer", "milk"]
  end
end
