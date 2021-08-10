class ConversationsController < ApplicationController

  before_action do
    @users = User.all.limit(3)
    @trends = ActsAsTaggableOn::Tag.most_used(5)
  end

  def index
    @users = User.where.not(id: current_user.id)
    @conversations = Conversation.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
  end

  def create
    if Conversation.between(params[:sender_id], params[:receiver_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:receiver_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end

    redirect_to conversation_messages_path(@conversation)
  end

  def search
    @parameter = params[:search].downcase
    @users = User.all.where("lower(username) like :search", search: "%#{@parameter}%")
  end

  private
    def conversation_params
      params.permit(:sender_id, :receiver_id)
    end
end
