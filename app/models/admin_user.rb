class AdminUser < ApplicationRecord
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:telegram]

  def password_required?
    provider.present? ? false : super
  end

  class << self
    def from_omniauth(auth)
      p auth
      p 'что-то пытаюсь'
      admin_user = where(email: auth.info.email).first || where(auth.slice(:provider, :uid).to_h).first || new
      admin_user.tap { |this| this.update_attributes(provider: auth.provider, uid: auth.uid, email: auth.info.email) }
    end
  end
end
