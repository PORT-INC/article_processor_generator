# frozen_string_literal: true

class Article::TableFilter < Handsaw::Filters::IndentedParagraph
  include HtmlBuilder
  def call # rubocop:disable Metrics/AbcSize
    doc.search('table').each do |table|
      html = markup(:table, class: 'pa-table') do |t|
        table.search('tbody').each do |tbody|
          tbody.search('tr').each do |tr|
            t.tr class: 'pa-table__row'
            tr.search('td').each_with_index do |td, index|
              if index.zero?
                t.th td.text, class: 'pa-table__title'
              else
                t.td td.text, class: 'pa-table__container'
              end
            end
          end
        end
      end
      table.replace Nokogiri::HTML.fragment(html)
    end
    doc
  end
end
