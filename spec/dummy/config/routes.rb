Rails.application.routes.draw do
  mount ArticleProcessorGenerator::Engine => "/article_processor_generator"
end
