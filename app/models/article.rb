class Article < ApplicationRecord
  belongs_to :creator, class_name: 'User', optional: true

  # NEW表示しておく日数
  NEW_INTERVAL_DAY = 7.days

  # 新着情報か？
  def new?
    (created_at + NEW_INTERVAL_DAY) > DateTime.now
  end

  def creator_name
    self.creator.try(:name) || Settings.system[:default][:user_name]
  end

end
