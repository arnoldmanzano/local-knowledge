class Picture < ActiveRecord::Base
  belongs_to :reply

  has_attached_file :image,
    :styles => { :medium => "800x800>", :thumb => "100x100#" }
    # :url  => "/images/reply_pics/:id/:filename"

  do_not_validate_attachment_file_type :image

  def image_url
    {
      thumb: image.url(:thumb),
      img: image.url(:original)
    }
  end

end
