class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable
  def self.ransackable_attributes(auth_object = nil)
    # List the attributes that you want to make searchable
    # while avoiding sensitive information.
    allowlist = %w[first_name last_name email]

    # Return the allowlist
    allowlist
  end
end
