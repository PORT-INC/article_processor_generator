# ArticleProcessorGenerator
## Requirement
```
Rails >= 5.0.1
Ruby >= 2.4.1
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'article_processor_generator', github: 'PORT-INC/article_processor_generator'
```

## Usage
下記のコマンドでprocessorとhelperの雛形を生成
`bin/rails generate article_processor_template`

生成する雛形は以下のとおり
- `app/processor`配下に記事用のmarkdown変換processorを生成
- `app/helpers`配下にmarkdown変換用helperの追加
- `app/lib`配下にprocessorが使用するライブラリの追加
