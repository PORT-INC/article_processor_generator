# frozen_string_literal: true

class Article::LinkFilter < Handsaw::Filters::IndentedParagraph
  include HtmlBuilder
  def template
    options = { class: 'pa-urlLink__text', href: @href }.tap do |hash|
      hash[:rel] = @rel unless @rel.nil?
      hash[:target] = @target unless @target.nil?
    end
    markup(:div, class: 'pa-urlLink') do |t|
      t.a options do
        t.span @title
      end
      t << @value
    end
  end
end
