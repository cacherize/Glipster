module GamesHelper
	def game_thumb(game)
		if game.image.present?
			image_tag(game.image.thumb('75x75#').url, alt: "#{game.title} image")
		else
			image_tag('default_game.png', alt: "#{game.title} image")
		end
	end

	def highlight_vote(game, val)
		if current_user.present?
			reps = game.reputations.where(user_id: current_user.id)
			"voted" if (reps.present? && (val == reps.first.value))
		end
	end
end
