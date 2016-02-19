class CommentsController < ApplicationController
  def create
    Comment.new.create_comment(current_user, params[:comment], params[:gram_id])
    redirect_to dashboard_index_path
  end
end
