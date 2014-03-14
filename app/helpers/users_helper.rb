module UsersHelper
	def avatar_thumb(user)
		if user.image.present?
			image_tag(user.image.thumb('30x30#').url)
		else
			image_tag('thumb_default_avatar.png')
		end
	end

	def avatar_large(user)
		if user.image.present?
			image_tag(user.image.thumb('150x150#').url)
		else
			image_tag('large_default_avatar.png')
		end
	end
end
