class CommentsController < ApplicationController
  def create
    Comment.create(current_user, params[:comment], params[:gram_id])
    redirect_to dashboard_index_path
  end

  def destroy
    Comment.destroy(current_user, params[:gram_id], params[:id])
    redirect_to dashboard_index_path
  end
end
