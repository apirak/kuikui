class MessagesController < ApplicationController
  # GET /messages
  # GET /messages.json
  def index
    @message = Message.new
    @messages = Message.order("created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages }
    end
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @message = Message.find(params[:id])

    # @comment = @message.comments.new
    @comment = Comment.new
    @comment.message_id = @message.id

    @comments = @message.comments
    logger.debug(@comments.length)
    logger.debug(@comments.length)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/1/edit
  def edit
    @message = Message.find(params[:id])
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(params[:message])
    @message.user_id = current_user.id

    respond_to do |format|
      if @message.save
        format.html { redirect_to messages_path, :notice => "Successfully created message" }
        format.json { render json: @message, status: :created, location: @message }
      else
        @messages = Message.all
        logger.debug(@message.errors[:content].join("; "))
        format.html { redirect_to messages_path } 
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.json
  def update
    @message = Message.find(params[:id])    

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end
end
