class Movie < ApplicationRecord
  validates :title, presence: true
  validates :year, presence: true
  validates :plot_summary, length: { maximum: 500 }
end
