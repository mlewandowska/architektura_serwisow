class Post < ActiveRecord::Base
  attr_accessible :text, :title, :tag_list
has_many :comments	
acts_as_taggable
end
