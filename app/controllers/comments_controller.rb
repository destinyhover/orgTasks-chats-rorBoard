# Контроллер для работы с комментариями к статьям
class CommentsController < ApplicationController
  before_action :authenticate_user!

  # Создание нового комментария
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    @comment.author = current_user.username

    if @comment.save
      redirect_to article_path(@article), notice: "Комментарий успешно добавлен."
    else
      redirect_to @article, alert: "Не удалось добавить комментарий."
    end
  end

  private

  # Ограничиваем набор разрешённых параметров
  def comment_params
    params.require(:comment).permit(:body)
  end
end
