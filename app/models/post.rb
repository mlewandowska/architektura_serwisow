# == Schema Information
#
# Table name: posts
#
#  id                 :integer          not null, primary key
#  title              :string(255)
#  text               :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

class Post < ActiveRecord::Base
  attr_accessible :text, :title, :tag_list, :photo, :photo_file_name, :photo_content_type, :photo_file_size, :photo_updated_at
has_many :comments	
acts_as_taggable

#Paperclip::Railtie.insert



has_attached_file :photo, :styles => { :small => "500x500>" },
                  :url  => "/assets/posts/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/posts/:id/:style/:basename.:extension"
                  #:storage => :database
                 # :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                 # :path => ":attachment/:id/:style.:extension",
                 # :bucket => 'yourbucket'

validates_presence_of :photo, :text

validates_attachment_size :photo, :less_than => 5.megabytes
validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

validates :title, :length => { :minimum => 2}

end
