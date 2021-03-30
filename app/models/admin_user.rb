class AdminUser < ApplicationRecord
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:telegram]

  def password_required?
    provider.present? ? false : super
  end

  class << self
    def from_omniauth(auth)
      admin_user = where(provider: auth.provider, provider_id: auth.uid).first
    end
  end
end
