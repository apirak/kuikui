class CommentsController < ApplicationController
  # POST /comments
  # POST /comments.json
  def create
    @message = Message.find(params[:comment][:message_id])
    @comment = @message.comments.new(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @message, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to @comment.message }
      format.json { head :no_content }
    end
  end
end
