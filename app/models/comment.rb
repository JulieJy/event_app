#
# @model
#
# @property id(required) [integer] comment's id
# @property author [string] comment author
# @property content [string] content of the comment
# @property created_at [date-time] Datetime of the comment creation
# @property updated_at [date-time] Datetime of the comment last update
#

class Comment < ApplicationRecord
  belongs_to :event

  validates_presence_of :author
  validates_presence_of :content
  validates_length_of :content, maximum: 140
end
