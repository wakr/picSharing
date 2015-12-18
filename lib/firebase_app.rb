require 'base64'
require 'digest/md5'
class Firebase_app

  BASE_URI = "https://flickering-torch-8083.firebaseio.com/" # should hide
  DB = "images"


  def self.encode(content)
    return Base64.strict_encode64(content)
  end

  def self.decode(content)
    return Base64.strict_decode64(content)
  end

  def self.form_name(name)
      return Digest::MD5.hexdigest(name)[0..5]
  end

  def self.push(image)
    firebase = Firebase::Client.new(BASE_URI)
    response = firebase.push(DB, image)
  end


  def self.pull(image_id)
    firebase = Firebase::Client.new(BASE_URI)
    response = firebase.get(DB, :name => image_id)
    return response.body
  end



end