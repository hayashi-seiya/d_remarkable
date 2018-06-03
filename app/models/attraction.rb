class Attraction < ApplicationRecord
  belongs_to :park
  validates :name, presence: true, uniqueness: true
end
