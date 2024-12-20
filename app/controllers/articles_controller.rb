class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]
  before_action :authorize_report, only: [:index, :new, :create]
  skip_before_action :authenticate_user!

  # GET /articles or /articles.json
  def index
    @articles = Article.open_post(current_user).page(params[:page]).per(10).kept
  end

  # GET /articles/1 or /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)
    @article.creator_id = current_user.id if user_signed_in?

    respond_to do |format|
      if @article.save
        format.html { redirect_to article_url(@article), notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_url(@article), notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.discard

    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def authorize_report
      authorize Article
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])

      authorize @article
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :content, :open)
    end
end
