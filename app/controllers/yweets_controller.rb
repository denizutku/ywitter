class YweetsController < ApplicationController
  before_action :set_yweet, only: %i[ show edit update destroy like unlike ]
  before_action :authenticate_user!

  # GET /yweets or /yweets.json
  def index
    @yweets = Yweet.all.includes(:user, :likes)
    @users = User.all.limit(3)
    @yweet = Yweet.new
  end

  # GET /yweets/1 or /yweets/1.json
  def show
  end

  # GET /yweets/new
  def new
    @yweet = Yweet.new
  end

  # GET /yweets/1/edit
  def edit
  end

  # POST /yweets or /yweets.json
  def create
    @yweet = Yweet.new(yweet_params)

    respond_to do |format|
      if @yweet.save
        format.html { redirect_to @yweet, notice: "Yweet was successfully created." }
        format.json { render :show, status: :created, location: @yweet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @yweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /yweets/1 or /yweets/1.json
  def update
    respond_to do |format|
      if @yweet.update(yweet_params)
        format.html { redirect_to @yweet, notice: "Yweet was successfully updated." }
        format.json { render :show, status: :ok, location: @yweet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @yweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yweets/1 or /yweets/1.json
  def destroy
    @yweet.destroy
    respond_to do |format|
      format.html { redirect_to yweets_url, notice: "Yweet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def like
    Like.create(user_id: current_user.id, yweet_id:@yweet.id)
    redirect_to root_path, alert: "Liked!"
  end

  def unlike
    like = Like.where(user_id: current_user.id, yweet_id:@yweet.id).first.destroy
    redirect_to root_path, alert: "Unliked!"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_yweet
      @yweet = Yweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def yweet_params
      params.require(:yweet).permit(:yweet, :user_id, :username)
    end
end
