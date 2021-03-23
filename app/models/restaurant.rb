class Restaurant < ApplicationRecord
  has_many :comments
  belongs_to :user

  validates :name, :address, presence: true
end
