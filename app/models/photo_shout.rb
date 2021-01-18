class PhotoShout < ApplicationRecord
  has_attached_file :image, styles: {thumb: "200*200"}

  validates_attachment :image,
    content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
    size: { in: 0..200.megabytes },
    presence: true
end
