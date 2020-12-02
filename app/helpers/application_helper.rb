module ApplicationHelper
  def flash_message
    if flash[:notice]
      content_tag :p, notice, :class => 'bg-success m-0 text-white text-center p-2'
    elsif flash[:alert]
      content_tag :p, alert, :class => 'bg-danger m-0 text-white text-center p-2'
    end
  end

  def signed_in?
    if user_signed_in?
      ("#{link_to current_user.username, edit_user_registration_path, class: 'btn text-light m-2'}" <<
       "#{link_to 'Logout', destroy_user_session_path, method: :delete, class: 'btn text-light m-2'}").html_safe
    else
      ("#{link_to 'Sing In', new_user_session_path, class: 'btn text-light m-2'}" <<
       "#{link_to 'Sing Up', new_user_registration_path, class: 'btn text-light m-2'}").html_safe
    end
  end

  def are_you_new?
    if user_signed_in?
      (render 'left-side').html_safe
    end
  end

  def like_or_dislike_btn(problem)
    like = Like.find_by(problem: problem, user: current_user)
    if like
      link_to('Dislike!', problem_like_path(id: like.id, problem_id: problem.id), method: :delete)
    else
      link_to('Like!', problem_likes_path(problem_id: problem.id), method: :post)
    end
  end
end
