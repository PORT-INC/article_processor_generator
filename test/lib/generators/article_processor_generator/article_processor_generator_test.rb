require 'test_helper'
require 'generators/article_processor/article_processor_generator'

module ArticleProcessorGenerator
  class ArticleProcessorGeneratorTest < Rails::Generators::TestCase
    tests ArticleProcessorGenerator
    destination Rails.root.join('tmp/generators')
    setup :prepare_destination

    # test "generator runs without errors" do
    #   assert_nothing_raised do
    #     run_generator ["arguments"]
    #   end
    # end
  end
end
