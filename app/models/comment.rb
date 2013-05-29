# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  fieldname  :string(255)
#  author     :string(255)
#

class Comment < ActiveRecord::Base
  attr_accessible :post_id, :text, :author
belongs_to :post

end
