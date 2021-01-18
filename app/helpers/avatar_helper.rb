module AvatarHelper
  def avatar(user)
    email_digest = Digest::MD5.hexdigest user.email
    gravatar_url = "//gravatar.com/avater/{email_digest}"
    image_tag gravatar_url
  end
end