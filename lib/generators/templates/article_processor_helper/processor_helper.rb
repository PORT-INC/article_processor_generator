module ProcessorHelper
  def article_html(markdown, index: true)
    ArticleProcessor.new.render(markdown, index: index).html_safe
  end
end
