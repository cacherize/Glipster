module CategoriesHelper
	def category_image(cat)
		image_tag("categories/#{cat.name.downcase}.png")
	end
end
