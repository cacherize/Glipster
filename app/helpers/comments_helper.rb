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
          remote: true,
          class: 'comment_vote_link'
        )
      else
        link_text
      end
    else
      link_to(
        link_text,
        login_path(admonition: 'Please login first')
      )
    end
  end
end
