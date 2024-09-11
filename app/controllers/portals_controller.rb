class PortalsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    # 新着情報
    @new_articles = Article.all.order(created_at: :desc).limit(5)
  end
end
