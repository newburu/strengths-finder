# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'csv'

def upsert_seeds(model:)
  now = Time.zone.now
  timestamps = { created_at: now, updated_at: now }
  file = File.read("db/seeds/#{model.to_s.underscore.pluralize}.csv")
  records = CSV.parse(file, headers: true).map do |row|
    row.to_h.merge(timestamps)
  end
  model.upsert_all(records)
end

upsert_seeds(model: Strength)

# 環境別にseed ファイルを読み込む
load(Rails.root.join("db", "seeds", "#{Rails.env.downcase}.rb"))
