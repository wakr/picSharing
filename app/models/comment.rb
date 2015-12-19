class Comment < ActiveRecord::Base
  belongs_to :picture
  validates :text, presence: true
end
