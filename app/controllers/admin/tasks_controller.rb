class Admin::TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_admin

  def index
    @articles = Article.includes(:assigned_user).order(created_at: :desc)
  end

  private

  def ensure_admin
    redirect_to(root_path, alert: t('flash.articles.unauthorized')) unless current_user&.admin?
  end
end
