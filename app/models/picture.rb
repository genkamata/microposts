class Picture < ActiveRecord::Base
  belongs_to :article

  has_attached_file :image,
                    :storage => :s3,
                    :s3_permissions => :public,
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :path => ":attachment/:id/:style.:extension"

  do_not_validate_attachment_file_type :image
end