# frozen_string_literal: true

class Article::FangateFilter < Handsaw::Filters::IndentedParagraph
  include ActionController
  def template # rubocop:disable all
    markup :div, class: 'pa-fangate' do |t|
      article = context[:article].is_a?(Article) ? context[:article] : context[:article]&.article
      t.div class: 'pa-fangate__main' do
        t.h3 'ここから先は会員のみご利用いただけます', class: 'pa-fangate__heading'
        t.p class: 'pa-fangate__text' do
          t << %(＼<span class="red">２分</span>で<span class="red">無料会員登録！</span>／)
        end
        t.ul class: 'pa-fangate__buttons' do
          t.li class: 'pa-fangate__item' do
            url = Rails.application.routes.url_helpers.article_path(article, signup: 1, anchor_value: :fangate)
            href = article ? url : ''
            t.a href: href, class: 'pa-fangate__button pa-fangate__button--red' do
              t << %(<i class="icon icon--arrowCircle"></i>無料会員登録)
            end
          end
          t.li class: 'pa-fangate__item' do
            url = Rails.application.routes.url_helpers.article_path(article, login: 1, anchor_value: :fangate)
            href = article ? url : ''
            t.a href: href, class: 'pa-fangate__button' do
              t << %(<i class="icon icon--arrowCircle"></i>ログイン)
            end
          end
        end
      end
    end
  end
end
