# frozen_string_literal: true

class Article::IndexFilter < HTML::Pipeline::Filter
  include HtmlBuilder
  def call # rubocop:disable Metrics/AbcSize
    count = 1
    @contents = []
    doc.search('h2').each do |t|
      next unless /head-\w+/.match?(t[:id])
      t[:id] = "head-#{count}"
      count += 1
      @contents << { href: "\##{t[:id]}", value: t.text }
    end
    doc.search('p').each do |p|
      p.replace Nokogiri::HTML.fragment(template) if p.text == '[index]'
    end
    doc
  end

  def template # rubocop:disable Metrics/AbcSize
    markup(:div, class: 'article-table-of-contents', 'data-outline': '') do |t|
      t.h3 '目次', class: 'article-table-of-contents-heading', 'data-outline-heading': ''
      t.div class: 'article-table-of-contents-body', 'data-outline-body': '' do
        t.ol class: 'article-table-of-contents-list', 'data-outline-list': '' do
          @contents.each_with_index do |content, i|
            classname = 'article-table-of-contents-list-item'
            classname += ' is-hide' if i > 2
            classname += ' is-blur' if i == 2 && @contents.length > 3

            t << %(<li class="#{classname}"><a class="article-table-of-contents-link" href="#{content[:href]}"><strong>#{content[:value]}</strong></a></li>) # rubocop:disable Metrics/LineLength
          end
          if @contents.length > 3
            t << %(<button class="article-table-of-contents-button" data-outline-button="">すべて見る</button>)
          end
        end
      end
    end
  end
end
