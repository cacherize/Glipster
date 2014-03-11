module UsersHelper
	def avatar_thumb(user)
		if current_user.image.present?
			image_tag(current_user.image.thumb('30x30#').url)
		else
			image_tag('thumb_default_avatar.png')
		end
	end
end
