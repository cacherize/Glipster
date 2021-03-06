module UsersHelper
	def avatar_thumb(user)
		if user.image.present?
			image_tag(user.image.thumb('30x').url, alt: "#{user.username} image", class: 'u_img')
		else
			image_tag('thumb_default_avatar.png', alt: "#{user.username} image", class: 'u_img')
		end
	end

	def avatar_large(user, id)
		if user.image.present?
			image_tag(user.image.thumb('150x').url, alt: "#{user.username} image", id: id)
		else
			image_tag('large_default_avatar.png', alt: "#{user.username} image", id: id)
		end
	end
end
