class Picture < ActiveRecord::Base

has_many :comments

  def create_image_data
      data = ::Firebase_app.pull(self.url)
      data.first[1]['data']
  end



end
