module UsersHelper
  def follow_unfollow(user)
    cntnt = link_to 'Unfollow', user_path, method: :delete, class: 'textdec-none form-btn unfollow-btn align-self-center'
    return cntnt if current_user.follows.include?(user)

    cntnt = link_to 'Follow', follow_path(user), class: 'textdec-none form-btn unfollow-btn align-self-center'
    return cntnt unless current_user.follows.include?(user) || current_user == user

    nil
  end
end
