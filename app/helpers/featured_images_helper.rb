module FeaturedImagesHelper
  def featured_image(featured)
    image_tag(featured.image.thumb('300x200#').url, alt: "Featured game image", title: featured.title)
  end
end
