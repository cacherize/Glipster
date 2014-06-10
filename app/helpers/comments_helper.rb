module CommentsHelper
  def comment_like_link(user, comment)
    likes = comment.comment_likes.size
    link_text = ((likes > 0) ? pluralize(likes, 'Like') : "Like")

    if user.present?
      unless comment.upvoters.include?(user)
        link_to(
          link_text, 
          comment_comment_likes_path(comment), 
          method: :post,
          remote: true
        )
      else
        like = comment.comment_likes.where(user_id: user.id).first
        "#{link_text} (#{link_to(
          "Unlike", 
          comment_comment_like_path(comment.id, like.id), 
          method: :delete,
          remote: true
        )})".html_safe
      end
    else
      link_to(
        link_text,
        login_path(admonition: 'Please login first')
      )
    end
  end
end
