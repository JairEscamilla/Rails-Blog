class ArticlesController < ApplicationController
    before_action :find_article, only: [:show, :edit, :destroy, :update]
    before_action :authenticate_user!, only: [:new, :edit, :create, :destroy]
    def index 
        @articles = Article.all
    end

    def show
    end

    def edit
    end

    def update
        @article.update(article_params)
        redirect_to @article
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.create(article_params)
        redirect_to @article
    end

    def destroy
        @article.destroy
        redirect_to root_path
    end

    def find_article
        @article = Article.find(params[:id])
    end

    def from_author
        @user = User.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :content)
    end
end
