class Asset < ActiveRecord::Base

    belongs_to :article
    has_attached_file :picture ,
      :styles => {
        :thumb=> "100x100#",
        :small  => "300x300>",
        :large => "600x600>"
         }
end
