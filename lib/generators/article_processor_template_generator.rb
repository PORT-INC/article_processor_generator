class ArticleProcessorTemplateGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def create_template
    directory('.', 'app/processors/')
  end
end
