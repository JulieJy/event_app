class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.valid?
      @comment.save
      flash[:success] = "Comment added successfully."
      redirect_to(event_path(@comment.event))
    else
      @error = @comment.errors.full_messages.to_s
      @error.delete! '[]'
      flash.now[:error] = @error
      render('events/show')
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:event_id, :author, :content)
  end
end
