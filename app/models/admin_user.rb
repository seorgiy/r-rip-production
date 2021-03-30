class AdminUser < ApplicationRecord
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:telegram]
  validate :check_invite

  def password_required?
    provider.present? ? false : super
  end

  def email_required?
    provider.present? ? false : super
  end

  class << self
    def from_omniauth(auth)
      admin_user = where(provider: auth.provider, provider_id: auth.uid).first
      return admin_user unless admin_user.nil?

      admin_user = self.new(provider: auth.provider, provider_id: auth.uid, tg_username: auth.info.nickname)
      admin_user.errors.add(:tg_username, "Мы такого не приглашали") unless Invite.approved.map(&:tg).include?(admin_user.tg_username.downcase)
      p admin_user.errors
      p admin_user.valid?
      admin_user.save if admin_user.valid?
      admin_user
     end
  end

  protected

  def check_invite
    errors.add(:tg_username, "Мы такого не приглашали") unless Invite.approved.map(&:tg).include?(self.tg_username)
  end
end
