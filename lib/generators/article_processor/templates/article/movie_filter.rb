# frozen_string_literal: true

class Article::MovieFilter < Handsaw::Filters::IndentedParagraph
  include HtmlBuilder
  def template
    parsed_url = Addressable::URI.parse(@href)
    options = { class: 'pa-movieBox__movie' }
    markup(:div, class: 'pa-movieBox') do |t|
      case parsed_url&.host
      when /youtube/
        video_id = URI.decode_www_form(parsed_url.query).to_h['v']
        t.iframe src: "//www.youtube.com/embed/#{video_id}", frameborder: 0, **options
      when /vimeo/
        video_id = parsed_url.path.split('/').second
        t.iframe src: "//player.vimeo.com/video/#{video_id}", **options
      end
      t.a "pa-movieBox__reference : #{parsed_url&.host}", class: 'movie__note', href: @href
    end
  end
end
