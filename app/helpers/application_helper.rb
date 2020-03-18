# frozen_string_literal: true

# application helper
module ApplicationHelper
  def redirect_me
    if user_signed_in?
      if current_user.has_role? :admin
        concat(render(partial: 'layouts/adminsidebar'))
      else
        concat(render(partial: 'layouts/header'))
      end
    else
      concat(render(partial: 'layouts/header'))
    end
  end
end
