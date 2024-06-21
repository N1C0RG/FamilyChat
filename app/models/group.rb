class Group < ApplicationRecord
  validates :name, :id_admin, :description, :photo, presence: :true
  has_and_belongs_to_many :users
end
