class Comment < ActiveRecord::Base
  attr_accessible :post_id, :text, :author
belongs_to :post
belongs_to :author
end
