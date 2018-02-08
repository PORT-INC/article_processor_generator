# frozen_string_literal: true

require 'cgi'

class Article::HtmlFilter < Handsaw::Filters::CodeBlock
  include ActionView::Helpers::TextHelper
  def template
    CGI.unescape(@value)
  end
end
