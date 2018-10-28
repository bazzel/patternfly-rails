# frozen_string_literal: true

class Post < ApplicationRecord
  validates :title, :description, presence: true
end
