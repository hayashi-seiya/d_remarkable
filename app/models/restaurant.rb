class Restaurant < ApplicationRecord
  belongs_to :park

  validates :name, presence: true
end
