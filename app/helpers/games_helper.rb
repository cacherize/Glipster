module GamesHelper
	def game_thumb(game)
		if game.image.present?
			image_tag(game.image.thumb('75x75#').url, alt: "#{game.title} image")
		else
			image_tag('default_game.png', alt: "#{game.title} image")
		end
	end

  def small_game_thumb(game)
    if game.image.present?
      image_tag(game.image.thumb('40x40#').url, alt: "#{game.title} image")
    else
      image_tag('small_default_game.png', alt: "#{game.title} image")
    end
  end

	def highlight_vote(game, val)
		if current_user.present?
			reps = game.reputations.where(user_id: current_user.id)
			"voted" if (reps.present? && (val == reps.first.value))
		end
	end

	def special_status_image(game)
		if game.featured
			image_tag("star.png", class: 'featured_icon')
		elsif game.featured_category_games.present?
			image_tag("blue_star.png", class: 'featured_icon')
		end
	end

  def featured_cat_header_icon
    "<span class='featured_star_icon'><img src='/assets/star.png' alt='featured star icon' /></span>".html_safe
  end

  def new_game_status(game)
    link_to('', game_path(game), class: 'new_status') if (game.created_at + 5.days) > DateTime.now
  end
end
