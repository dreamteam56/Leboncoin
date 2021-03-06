class Upload < ActiveRecord::Base

    belongs_to :annonce
    has_attached_file :picture ,
      :styles => {
        :thumb=> "100x100#",
        :small  => "300x300>",
        :large => "600x600>"
         }
    validates_attachment :picture, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
end
