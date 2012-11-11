class Comment < ActiveRecord::Base

  belongs_to :fortune
  attr_accessible :author, :body

  validates :author, presence: true
  validates :body, presence: true

end
