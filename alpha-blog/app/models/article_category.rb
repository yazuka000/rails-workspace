class ArticleCategory < ApplicationRecord
  belongs_to :articles
  belongs_to :category
end
