class CommentsController < ApplicationController
  def create
    Comment.new.create_comment(current_user, params[:comment], params[:gram_id])
    redirect_to dashboard_index_path
  end

  def delete
    # i need to get the media is and the comment id maybe from the params and pass them in
    Comment.new.destroy(current_user, params[:media_id], params[:comment_id])
    redirect_to dashboard_index_path
  end
end
