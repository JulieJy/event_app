class Comment < ApplicationRecord
  belongs_to :event

  validates_presence_of :author
  validates_presence_of :content
  validates_length_of :content, maximum: 140
end
