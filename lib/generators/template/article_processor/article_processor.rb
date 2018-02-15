class ArticleProcessor < Handsaw::BaseProcessor
  def render(markdown, with_index: false, **context)
    pipe = HTML::Pipeline.new(filters, @context)
    markdown = "\[index\]\n\n#{markdown}" if with_index
    pipe.call(markdown, **context)[:output]
  end

  private

  def markdown_filter
    Redcarpet::Markdown.new(
      CustomRender,
      tables: true, disable_indented_code_blocks: true, fenced_code_blocks: true, hard_wrap: true
    )
  end
end
