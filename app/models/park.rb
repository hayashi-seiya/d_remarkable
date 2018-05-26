class Park < ApplicationRecord
  has_many :attractions, dependent: :destroy
  has_many :shows, dependent: :destroy
  has_many :restaurants, dependent: :destroy

  validates :name, presence: true
  validates :business_hours_open, presence: true
  validates :business_hours_close, presence: true
end
