# frozen_string_literal: true

class Article::BlockQuoteFilter < HTML::Pipeline::Filter
  include HtmlBuilder
  def call
    doc.search('pre').each do |b|
      html = markup(:div, class: 'pa-editerBox') do |t|
        t.pre do
          b.search('code').text.each_line do |line|
            t.code line if line.present?
          end
        end
      end
      b.replace Nokogiri::HTML.fragment(html)
    end
    doc
  end
end
