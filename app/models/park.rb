class Park < ApplicationRecord
  has_many :attractions

  validates :name, presence: true
  validates :business_hours_open, presence: true
  validates :business_hours_close, presence: true
end
