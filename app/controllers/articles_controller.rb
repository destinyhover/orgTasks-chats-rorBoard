class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authorize_user, only: [:edit, :update, :destroy]  

 
  def index
    @articles = Article.order(created_at: :desc)
    
  end
    def show
    @article = Article.find(params[:id])
    @comments = @article.comments
  end

  def edit
    end

  def new
    @article = Article.new
  end

  def create
    # Разрешаем параметры
    @article = Article.new(article_params)
    @article.user_id = current_user.id

    if @article.save
       redirect_to articles_path(@article)
    else
      render action: "new"
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
    @article.destroy                       # Удаляем статью
    redirect_to articles_path, notice: "Article was successfully deleted."
    return 
  end

  private
  def article_params
    # Разрешаем параметры title и text
    params.require(:article).permit(:title, :text, :status, :assigned_user_id)
  end

def authorize_user
  @article = Article.find(params[:id])

  # Если это update-запрос, и текущий пользователь — assigned_user
  if action_name == "update" && @article.assigned_user_id == current_user.id
    return
  end

  # Остальные действия — только для автора
  if current_user != @article.user
    redirect_to articles_path, alert: "You are not authorized to perform this action."
  end
end



end
