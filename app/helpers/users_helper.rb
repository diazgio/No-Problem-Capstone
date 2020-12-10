module UsersHelper
  def follow_unfollow(user)
    cntnt = link_to 'Unfollow', following_path, method: :delete, class: 'btn bg-navbar text-light'
    return cntnt if current_user.follows.include?(user)

    cntnt = link_to 'Follow', follow_path(user), class: 'btn bg-navbar text-light'
    return cntnt unless current_user.follows.include?(user) || current_user == user

    nil
  end

  def user_avatar(user)
    if user.avatar.attached?
      image_tag user.avatar.variant(resize: '90x90!'), class: 'rounded-circle avatar'
    else
      image_tag('avatar.png', class: 'rounded-circle', height: 130, width: 130)
    end
  end

  def user_cover
    if @user.cover_image.attached?
      image_tag @user.cover_image, class: 'col-12 p-0', style: 'height: 30rem'
    else
      image_tag('cover.jpg', class: 'col-12 p-0', style: 'height: 30rem')
    end
  end

  def edit_avatar
    if resource.avatar.attached?
      image_tag resource.avatar.variant(resize: '90x90!'), class: 'rounded-circle'
    else
      image_tag('avatar.png', class: 'rounded-circle', height: 90, width: 90)
    end
  end

  def edit_cover
    if resource.cover_image.attached?
      image_tag resource.cover_image.variant(resize: '90x90!'), class: 'rounded-circle'
    else
      image_tag('avatar.png', height: 90, width: 90)
    end
  end

  def current_avatar
    if current_user.avatar.attached?
      image_tag current_user.avatar.variant(resize: '90x90!'), class: 'rounded-circle'
    else
      image_tag('avatar.png', class: 'rounded-circle', height: 90, width: 90)
    end
  end

  def comment_settings(problem)
    if user_signed_in? && current_user.id == problem.user_id
      content_tag :div, class: 'd-flex justify-content-between'
      "#{link_to edit_problem_path(id: problem.id), class: 'text-dark mx-2 icon-comment' do
           fa_icon 'edit'
         end}" \
      "#{link_to edit_problem_path(id: problem.id), class: 'text-dark mx-2 icon-comment' do
           fa_icon 'trash-alt'
         end}".html_safe
    end
  end
end
