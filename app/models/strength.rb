class Strength < ApplicationRecord
  enum kind: {
    strategic_thinking:     1,  # 思考力
    relationship_building:  2,  # 人間関係力
    influencing:            3,  # 影響力
    executing:              4,  # 実行力
  }
end
