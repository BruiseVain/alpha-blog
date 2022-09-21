class ArticlesController < ApplicationController
  #Dette under blir da utført før noe annet skjer i controlleren, og kun for de i tabellen.
  before_action :set_article, only: [:show,:edit,:update,:destroy]

  def show
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      flash[:notice] = "The article was created with great success!"
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully mafakka."
      redirect_to @article
    else
      render 'edit'
    end

  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private #Alt under her er kun tilgjengelig i controlleren og ikke utenfor:

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

end
