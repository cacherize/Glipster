module UsersHelper
	def avatar_thumb(user)
		if user.image.present?
			image_tag(user.image.thumb('30x30#').url, alt: "#{user.username} image")
		else
			image_tag('thumb_default_avatar.png', alt: "#{user.username} image")
		end
	end

	def avatar_large(user)
		if user.image.present?
			image_tag(user.image.thumb('150x150#').url, alt: "#{user.username} image")
		else
			image_tag('large_default_avatar.png', alt: "#{user.username} image")
		end
	end
end
