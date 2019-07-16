class ArticlesController < ApplicationController
    before_action :find_article, only: [:show, :edit, :destroy, :update]
    before_action :authenticate_user!, only: [:new, :edit, :create, :destroy]
    before_action :visits_count, only: [:show]
    def index 
        @articles = Article.all
    end

    def show
    end

    def edit
        @categories = Category.all
    end

    def update
        @article.update(article_params)
        @article.save_categories
        redirect_to @article
    end

    def new
        @article = Article.new
        @categories = Category.all
    end

    def create
        @article = current_user.articles.create(article_params)
        @article.save_categories
        redirect_to @article
    end

    def destroy
        @article.categories.destroy_all
        @article.destroy
        redirect_to root_path
    end

    def find_article
        @article = Article.find(params[:id])
    end

    def from_author
        @user = User.find(params[:user_id])
    end
    def myarticles
        user = User.where(id: params[:id])
        @articles = user.first.articles
    end

    def visits_count
        article = Article.find(params[:id])
        @counter = article.visits
        @counter = @counter + 1
        article.update(visits: @counter)
    end

    def article_params
        params.require(:article).permit(:title, :content, category_elements: [])
    end
end
