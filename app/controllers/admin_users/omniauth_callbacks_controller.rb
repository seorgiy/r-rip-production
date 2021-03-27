class AdminUsers::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def telegram
    p 'тык'
    admin_user = AdminUser.from_omniauth(auth_hash)
    p 'и тут пытаюсь'

    if admin_user.persisted?
      flash.notice = "Signed in!"
      sign_in_and_redirect admin_user
    else
      flash.notice = "We couldn't sign you in because: " + admin_user.errors.full_messages.to_sentence
      redirect_to new_admin_user_session_url
    end
  end

  private

  def auth_hash
    request.env["omniauth.auth"]
  end

end
