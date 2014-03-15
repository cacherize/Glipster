module GamesHelper
	def game_thumb(game)
		if game.image.present?
			image_tag(game.image.thumb('75x75#').url, alt: "#{game.title} image")
		else
			image_tag('default_game.png', alt: "#{game.title} image")
		end
	end
end
