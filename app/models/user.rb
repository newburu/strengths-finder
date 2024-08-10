class User < ApplicationRecord
  has_many :user_strengths, -> {order(:no)}, dependent: :destroy
  accepts_nested_attributes_for :user_strengths, allow_destroy: true
  has_many :strengths, through: :user_strengths
end
