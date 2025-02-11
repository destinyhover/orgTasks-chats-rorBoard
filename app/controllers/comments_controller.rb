class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @article=Article.find(params[:article_id])
    @comment=@article.comments.new(comment_params)
    @comment.author = current_user.username
    if @comment.save
      redirect_to article_path(@article), notice: "Комментарий успешно добавлен."
      else
      redirect_to @article, alert: "Не удалось добавить комментарий."
    end
    
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
    
  end
end
