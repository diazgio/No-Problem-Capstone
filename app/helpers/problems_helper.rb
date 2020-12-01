module ProblemsHelper
  def formate
    if user_signed_in?
      (render 'myproblem').html_safe
    else
      content_tag :h2, 'Sing Up to post Something',
                  :class => 'text-center border p-2 my-2 bg-light rounded border-secondary'
    end
  end
end
