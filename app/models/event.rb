class Event < ApplicationRecord
  has_many :comments

  validates_presence_of :name
  validates_presence_of :date
  validates_presence_of :email
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates_length_of :description, maximum: 300
end
