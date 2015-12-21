require 'base64'
require 'digest/md5'
class EncodeUtils

  def self.encode(content)
    return Base64.strict_encode64(content)
  end

  def self.decode(content)
    return Base64.strict_decode64(content)
  end

  def self.form_name(name)
      return Digest::MD5.hexdigest(name + "#{('a'..'z').to_a.shuffle[0,3].join}")[0..7]
  end

end