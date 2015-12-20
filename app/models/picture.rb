class Picture < ActiveRecord::Base

has_many :comments, dependent: :destroy

has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>"}
validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

before_post_process :check_file_size
def check_file_size
  valid?
  errors[:image_file_size].blank?
end


  def create_image_data
      data = ::Firebase_app.pull(self.url)
      data.first[1]['data']
  end


end
