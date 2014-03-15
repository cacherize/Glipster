module GamesHelper
	def game_thumb(game)
		if game.image.present?
			image_tag(game.image.thumb('75x75#').url)
		else
			image_tag('default_game.png')
		end
	end
end
