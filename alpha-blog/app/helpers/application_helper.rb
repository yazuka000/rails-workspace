module ApplicationHelper
=begin
  # 追記
  def full_title(page_title = '')
    base_title = "alpha-blog"
    if page_title.empty?
      base_title
    else
      "#{ page_title } | #{ base_title }"
    end
  end
=end

  def gravater_for(user, options = { size: 80 })
    email_address = user.email.downcase
    hash = Digest::MD5.hexdigest(email_address)
    size = options[:size]
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(
      gravatar_url,
      alt: user.username,
      class: "rounded shadow mx-auto d-block"
    )
  end
end
