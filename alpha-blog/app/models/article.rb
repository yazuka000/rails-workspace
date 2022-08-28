class Article < ApplicationRecord 
    # タイトルが空欄だとエラーになる    ６字から100字の文字列でないとエラーになる
    validates :title, presence: true, length: {minimum: 6, maximum: 100}

    validates :description, presence: true, length: {minimum: 10, maximum: 300}

end