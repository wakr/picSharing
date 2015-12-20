class Picture < ActiveRecord::Base

has_many :comments

has_attached_file :image
validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def create_image_data
      data = ::Firebase_app.pull(self.url)
      data.first[1]['data']
  end


end
