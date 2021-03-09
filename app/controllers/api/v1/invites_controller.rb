module Api
  module V1
    class InvitesController < ApiController

      def index
        page = params[:page].to_i
        invites = Invite.offset(20*(page)).limit(20).order(created_at: :desc)
        render jsonapi: invites, class: { Invite: Api::V1::SerializableInvite }
      end


      def show
        render jsonapi: Invite.find(params[:id]),
        fields: { invites: [:email] }, class: { Invite: Api::V1::SerializableInvite }
      end

      def create
        invite = Invite.new(invite_params)
        invite.save!

        render jsonapi: invite,
        fields: { invites: [:email] }, class: { Invite: Api::V1::SerializableInvite }
      end

      private

      def invite_params
        params.permit(:tg, :name, :email)
      end
    end
  end
end
