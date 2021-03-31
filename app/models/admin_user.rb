class AdminUser < ApplicationRecord
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:telegram]
  validate :check_invite, on: :create

  def password_required?
    provider.present? ? false : super
  end

  def email
    self[:email]
  end

  class << self
    def from_omniauth(auth)
      admin_user = where(provider: auth.provider, provider_id: auth.uid).first
      return admin_user unless admin_user.nil?
      auth.info.nickname.downcase!

      admin_user = self.new(provider: auth.provider, provider_id: auth.uid, tg_username: auth.info.nickname)
      invite = Invite.approved.where(tg: admin_user.tg_username.downcase).first
      if invite.nil?
        admin_user.errors.add(:tg_username, "Мы такого не приглашали")
      else
        admin_user[:email] = invite[:email]
      end

      admin_user.save if admin_user.valid?
      admin_user
     end
  end

  protected

  def check_invite
    p 'валидирую'
    errors.add(:tg_username, "Мы такого не приглашали") if Invite.approved.where(tg: self.tg_username.downcase).empty?
  end
end
