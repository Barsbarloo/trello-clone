class Item < ApplicationRecord
  belongs_to :list

  validates :title, presence: true

  has_many :item_users, dependent: :destroy
  has_many :members, through: :item_users, source: :user
end
