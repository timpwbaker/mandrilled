class Event < ApplicationRecord
  validates :address, presence: true
  validates :email_type, presence: true
  validates :event, presence: true
  validates :timestamp, presence: true
end
