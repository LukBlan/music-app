module UserHelper
  def show_if_current_user_is_admin(&block)
    result = capture(&block)

    return result if current_user.admin
    ""
  end
end
