class Board < ApplicationRecord
  belongs_to :user

  validates :name, presence: true

  has_many :lists, dependent: :destroy

  has_many :board_users, dependent: :destroy
  has_many :members, through: :board_users, source: :user
end
