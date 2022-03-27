class Tag < ApplicationRecord
  belongs_to :post

  validates :category, presence: true
end
