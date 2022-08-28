FROM ruby:3.0.3

# 環境変数の設定
ENV RAILS_ENV=production

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq \
    && apt-get install -y nodejs yarn \
    && mkdir /alpha-blog

WORKDIR /alpha-blog

COPY Gemfile /alpha-blog/Gemfile

COPY Gemfile.lock /alpha-blog/Gemfile.lock

RUN bundle install

COPY . /alpha-blog

COPY entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]

# ローカル開発環境のstart.shの内容をDockerコンテナ上の/start.shにコピー
#COPY start.sh /start.sh
# Docker側の下記のファイルに実行権限を渡すので権限を変更する
#RUN chmod 744 /start.sh
# 実行
#CMD ["sh", "/start.sh"]