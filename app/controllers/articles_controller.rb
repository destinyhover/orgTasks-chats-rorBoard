# Контроллер, отвечающий за CRUD-операции над задачами (Article)
class ArticlesController < ApplicationController
  # Только авторизованный пользователь может создавать и редактировать статьи
  before_action :authenticate_user!, only: %i[new edit create update destroy]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authorize_user, only: %i[edit update destroy]

  # Список всех задач в обратном порядке создания
  def index
    @articles = Article.order(created_at: :desc)
  end

  # Показ отдельной статьи и комментариев к ней
  def show
    @article = Article.find(params[:id])
    @comments = @article.comments
  end

  def edit; end

  # Форма создания новой задачи
  def new
    @article = Article.new
  end

  # Создаём запись в базе данных
  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id

    if @article.save
      redirect_to articles_path(@article)
    else
      render action: :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: "Article updated!"
    else
      render :edit
    end
  end

  def destroy
    @article.comments.destroy_all
    @article.destroy # Удаляем статью вместе с комментариями
    redirect_to articles_path, notice: "Article was successfully deleted."
  end

  private

  # Разрешённые параметры для статьи
  def article_params
    params.require(:article).permit(:title, :text, :status, :assigned_user_id)
  end

  # Проверяем права доступа пользователя к статье
  def authorize_user
    @article = Article.find(params[:id])

    # Исполнитель может обновлять статус
    return if action_name == "update" && @article.assigned_user_id == current_user.id

    # Остальные действия доступны только автору
    if current_user != @article.user
      redirect_to articles_path, alert: "You are not authorized to perform this action."
    end
  end
end
