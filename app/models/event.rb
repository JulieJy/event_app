#
# @model
#
# @property id(required) [integer] event's id
# @property name [string] event title
# @property date [date] date of the event
# @property email [string] email of the organizer
# @property description [text] description of the event
# @property created_at [date-time] Datetime of the event creation
# @property updated_at [date-time] Datetime of the event last update
#
class Event < ApplicationRecord
  has_many :comments

  validates_presence_of :name
  validates_presence_of :date
  validates_presence_of :email
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates_length_of :description, maximum: 300
end
