class Article < ApplicationRecord
  belongs_to :creator, class_name: 'User', optional: true

  # NEW表示しておく日数
  NEW_INTERVAL_DAY = 7.days

  scope :open_post, -> (user) {where(open: true).or(Article.where(creator: user)).order(created_at: :desc)}
  scope :new_post, -> (user) {open_post(user).where(created_at: (DateTime.now - NEW_INTERVAL_DAY)...)}


  # 新着情報か？
  def new?
    (created_at + NEW_INTERVAL_DAY) > DateTime.now
  end

  def creator_name
    self.creator.try(:name) || Settings.system[:default][:user_name]
  end

end
