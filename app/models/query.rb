class Query < ApplicationRecord
  validates :latitude, numericality: { greater_than_or_equal_to: -90,
                                       less_than_or_equal_to: 90 }

  validates :longitude, numericality: { greater_than_or_equal_to: -180,
                                        less_than_or_equal_to: 180 }

  validates :email, presence: true, length: { in: 6..254 }
end
