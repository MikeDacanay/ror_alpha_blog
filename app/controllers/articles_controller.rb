class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]

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
            flash[:notice] = 'Article was created successfully!'
            redirect_to @article
        elsif
            render 'new'
        end
    end

    def update
        #updates 

        if @article.update(article_params)
            flash[:notice] = 'Article was edited successfully!'
            redirect_to @article
        elsif
            render 'edit'
        end
    end

    def destroy
        #end
        @article.destroy
        redirect_to articles_path
    end

    private

    def set_article
        @article = Article.find(params[:id]);
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end
end
