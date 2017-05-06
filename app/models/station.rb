class Station < ApplicationRecord
  validates :name, :code, presence: true
  has_many :visits
end
