class RepliesController < ApplicationController
  before_filter :authenticate_user!, except: [:new,:create,:show]
  before_action :set_reply, only: [:show, :edit, :update, :destroy]

  def index
    @replies = Reply.all
  end

  # GET /replies/1
  # GET /replies/1.json
  def show
    @form= Form.find(params[:form_id])
  end

  # GET /replies/new
  def new
    @reply = Reply.new(form_id: params[:form_id])
    @form = Form.find(params[:form_id])
  end

  # GET /replies/1/edit
  def edit
  end

  # POST /replies
  # POST /replies.json
  def create
    @form= Form.find(params[:form_id])
    @reply = Reply.new(reply_params)

    respond_to do |format|
      if @reply.save
        format.html { redirect_to form_reply_path(@form,@reply), notice: 'Reply was successfully created.' }
        format.json { render :show, status: :created, location: @reply }
      else
        format.html { render :new }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /replies/1
  # PATCH/PUT /replies/1.json
  def update
    respond_to do |format|
      if @reply.update(reply_params)
        format.html { redirect_to @reply, notice: 'Reply was successfully updated.' }
        format.json { render :show, status: :ok, location: @reply }
      else
        format.html { render :edit }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /replies/1
  # DELETE /replies/1.json
  def destroy
    @reply.destroy
    respond_to do |format|
      format.html { redirect_to replies_url, notice: 'Reply was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reply
      @reply = Reply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reply_params
      params.require(:reply).permit(:form_id).tap do |whitelisted|
        whitelisted[:properties] = params[:reply][:properties]
      end
    end
end
