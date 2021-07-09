module ApplicationHelper
	def gravatar_for(user, option = { size: 80 })
		gravatar_id = Digest::MD5::hexdigest(user.email)
		size = option[:size]
		url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
		image_tag(url,alt: "User Profile", class: "img-circle")
	end
end
