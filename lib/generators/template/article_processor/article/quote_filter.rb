# frozen_string_literal: true

class Article::QuoteFilter < Handsaw::Filters::IndentedParagraph
  include HtmlBuilder
  def template
    if context[:article] && !@href
      context[:article].errors.add(:invalid_url, '引用URLが指定されていません')
    end
    host = ::Addressable::URI.parse(@href).try(:host)
    return '' unless host
    markup(:div, class: 'pa-quotationBox') do |t|
      t.div class: 'pa-quotationBox__content' do
        t.a href: @href do
          t << @value
        end
      end
      t.a "#{@title}(出典：#{host})", href: @href, class: 'pa-quotationBox__link'
    end
  end
end
