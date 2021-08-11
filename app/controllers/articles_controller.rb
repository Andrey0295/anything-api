class ArticlesController < ApplicationController
  before_action :authenticate_user!

   def index
     articles = Article.all
     render json: articles
  end

  def create
    article = Article.new(
      user_id: current_user[:id],
      title: params[:title],
      body: params[:body]
    )

    article.save
    
    if article.save
       render json: article
    else
      render json: { errors:  'Somthing went wrong'  }
    end

  end

  def show_my_articles
     article = Article.where(user_id: current_user.id)
     render json: article
  end

  def update
    article = Article.find(params[:article_id])
    article.update(title: params[:title], body: params[:body])

    article.save

    render json: article
    
    
  end

  def delete
    article = Article.find(params[:id])
    article.destroy
  end

  private 

  def article_params
    params.require(:article).permit(:title, :body, :article_id)
  end

end
