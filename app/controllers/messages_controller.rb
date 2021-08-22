class MessagesController < ApplicationController
  before_action :authenticate_user!


  before_action do
    @conversation = Conversation.find(params[:conversation_id])
    @users = User.all.limit(3)
    @trends = ActsAsTaggableOn::Tag.most_used(5)
  end

  def index
    @messages = @conversation.messages
    @user = User.find(current_user.id.eql?(@conversation.receiver_id) ? @conversation.sender_id : @conversation.receiver_id) #this has to be fixed to select user properly.
                                                  # now only selects receiver user...

    @messages.where("user_id != ? AND read = ?", current_user.id, false).update_all(read: true)
    @message = @conversation.messages.new
  end

  def create
    @message = @conversation.messages.new(message_params)
    @message.user = current_user

    if @message.save
      redirect_to conversation_messages_path(@conversation)
    end
  end

  private
    def message_params
      params.require(:message).permit(:body, :user_id)
    end
end
