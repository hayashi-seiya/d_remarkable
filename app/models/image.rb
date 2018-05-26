class Image < ApplicationRecord
  validates :type, presence: true
  validates :type_id, presence: true
  validates :name, presence: true
end
