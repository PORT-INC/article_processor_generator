class ArticleProcessorTemplateGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def create_template
    directory('./article_processor/', 'app/processors/')
    create_file('./article_processor_helper/processor_helper.rb', 'app/helpers/processor_helper.rb')
  end
end
