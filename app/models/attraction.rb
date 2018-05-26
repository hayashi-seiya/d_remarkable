class Attraction < ApplicationRecord
  belongs_to :park

  validates :name, presence: true
  validates :waiting_time, presence: true
end
