# frozen_string_literal: true

class Article::ImageFilter < Handsaw::Filters::IndentedParagraph
  include HtmlBuilder
  def template
    markup(:div, class: 'article-image-box') do |t|
      options = { class: 'article-image-inner-box' }
      options.merge!(href: @href, rel: 'nofollow', target: '_blank') if @href
      t.a options do
        t.figure do
          img_options = { src: @path, class: 'article-image image' }
          img_options[:alt] = @alt if @alt
          t.img img_options
          t.figcaption @text if @text.present?
        end
      end
    end
  end
end
