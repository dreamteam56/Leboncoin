class Annonce < ActiveRecord::Base

  has_many :uploads, :dependent => :destroy
  accepts_nested_attributes_for :uploads, :allow_destroy => true
  # has_attached_file :picture, {
  #   :styles => {
  #     :thumb => ["50x50#", :png],
  #     :medium => ["100x100#", :png],
  #     :large => ["150x150>", :png]
  #   },
  #   :convert_options => {
  #     :thumb => "-gravity Center -crop 50x50+0+0",
  #     :thumb => "-gravity Center -crop 100x100+0+0",
  #   }
  # }
  # validates_attachment_content_type :picture, :content_type => ["image/png","image/jpg","image/jpeg","image/gif"]

  belongs_to :user
  has_one :category
  def is_owned_by?(other_user)
    other_user && other_user.id == user_id
  end

end
