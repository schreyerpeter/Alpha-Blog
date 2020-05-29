class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
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
    @article = Article.new(params.require(:article).permit(:title, :description))
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
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article was updated successfully"
      redirect_to @article
    else 
      render 'edit'
    end
  end
end