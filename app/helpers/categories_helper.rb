module CategoriesHelper
	def category_image(cat)
		image_tag("categories/#{cat.name.downcase}.png", alt: "#{cat.name}")
	end
end
