class AdminUsers::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def telegram
    admin_user = AdminUser.from_omniauth(auth_hash)

    if admin_user.persisted?
      flash.notice = "Signed in!"
      sign_in_and_redirect admin_user
    else
      flash.notice = "Кто ты такой? Тебя сюда не звали."
      redirect_to new_admin_user_session_url
    end
  end

  private

  def auth_hash
    request.env["omniauth.auth"]
  end

end
