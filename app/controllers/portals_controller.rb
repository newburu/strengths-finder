class PortalsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    # 新着情報
    @new_articles = Article.new_post(current_user)
  end
end
