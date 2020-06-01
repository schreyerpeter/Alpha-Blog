class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
  end
  def index
    @articles = Article.all
  end
  def new
    # we need to do this for the first time we load the page to make @article exist
    @article = Article.new
  end
  def create
    # Need to add this to whitelist properties to allow
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was created successfully"
      # Rails plucks id out of @article for redirect
      # redirect_to article_path(@article) # can be shortened to the next line
      redirect_to @article
    else
      render 'new'
    end
  end
  def edit
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully"
      redirect_to @article
    else 
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private 

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end