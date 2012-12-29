class Post < ActiveRecord::Base
  attr_accessible :text, :title, :tag_list, :photo
has_many :comments	
acts_as_taggable

#Paperclip::Railtie.insert



has_attached_file :photo, :styles => { :small => "500x500>" },
                  :url  => "/assets/posts/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/posts/:id/:style/:basename.:extension"

validates_attachment_presence :photo
validates_attachment_size :photo, :less_than => 5.megabytes
validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']


end
