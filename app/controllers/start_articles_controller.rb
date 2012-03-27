# encoding: utf-8
class StartArticlesController < ApplicationController
  before_filter :set_page
  before_filter :is_admin, :except=>:index

  # GET /start_articles
  # GET /start_articles.json
  def index
    @start_articles = StartArticle.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @start_articles }
    end
  end

  # GET /start_articles/1
  # GET /start_articles/1.json
  def show
    @start_article = StartArticle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @start_article }
    end
  end

  # GET /start_articles/new
  # GET /start_articles/new.json
  def new
    @start_article = StartArticle.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @start_article }
    end
  end

  # GET /start_articles/1/edit
  def edit
    @start_article = StartArticle.find(params[:id])
  end

  # POST /start_articles
  # POST /start_articles.json
  def create
    @start_article = StartArticle.new(params[:start_article])

    respond_to do |format|
      if @start_article.save
        format.html { redirect_to @start_article, notice: 'Новая ствтья о компании создана' }
        format.json { render json: @start_article, status: :created, location: @start_article }
      else
        format.html { render action: "new" }
        format.json { render json: @start_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /start_articles/1
  # PUT /start_articles/1.json
  def update
    @start_article = StartArticle.find(params[:id])

    respond_to do |format|
      if @start_article.update_attributes(params[:start_article])
        format.html { redirect_to start_articles_path, notice: 'Статья обновлена' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @start_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /start_articles/1
  # DELETE /start_articles/1.json
  def destroy
    @start_article = StartArticle.find(params[:id])
    @start_article.destroy

    respond_to do |format|
      format.html { redirect_to start_articles_url }
      format.json { head :no_content }
    end
  end

  private

  def set_page
    @selected_page=:page1
  end

end
