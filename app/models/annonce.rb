class Annonce < ActiveRecord::Base

  has_attached_file :picture, {
    :styles => {
      :thumb => ["50x50#", :png],
      :medium => ["100x100#", :png],
      :large => ["150x150>", :png]
    },
    :convert_options => {
      :thumb => "-gravity Center -crop 50x50+0+0",
      :thumb => "-gravity Center -crop 100x100+0+0",
    }
  }
  validates_attachment_content_type :picture, :content_type => ["image/png","image/jpg","image/jpeg","image/gif"]
end
