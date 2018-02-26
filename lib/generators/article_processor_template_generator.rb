class ArticleProcessorTemplateGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def create_template
    directory('./article_processor/', 'app/processors/')
    copy_file('./article_processor_helper/processor_helper.rb', 'app/helpers/processor_helper.rb')
    copy_file('./article_processor_lib/html_builder.rb', 'lib/html_builder.rb')
  end
end
