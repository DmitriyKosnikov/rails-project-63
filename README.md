[![Actions Status](https://github.com/DmitriyKosnikov/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/DmitriyKosnikov/rails-project-63/actions) 

[![Linter Status](https://github.com/DmitriyKosnikov/rails-project-63/actions/workflows/lint.yml/badge.svg)](https://github.com/DmitriyKosnikov/rails-project-63/actions)

[![Test Status](https://github.com/DmitriyKosnikov/rails-project-63/actions/workflows/test.yml/badge.svg)](https://github.com/DmitriyKosnikov/rails-project-63/actions)

# HexletCode

HexletCode - это гем для легкой генерации HTML форм. С помощью него вы сможете генерировать как формы так и обычные теги, с возможностью кастомизировать различные поля.

## Installation
Install the gem and add to the application's Gemfile by executing:

```bash
bundle add hexlet-code
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install hexlet_code
```

## Usage
Using the HexletCode.form_for method, you can create HTML forms with specific fields based on the passed object.

Используя метод HexletCode.form_for, вы можете создавать HTML-формы с кастомизированными полями основанными на данных из другой структуры.

```ruby
User = Struct.new(:name, :job, keyword_init: true)
user = User.new job: 'hexlet'

HexletCode.form_for user do |f|
  f.input :name
  f.input :job
  f.submit
end
```
Вернет следующий код:

```html
<form action="#" method="post">
<label for="name">Name</label><input name="name" type="text" value=""><label for="job">Job</label><input name="job" type="text" value="hexlet"><input type="submit" value="Save"></form>
```

Вы можете генерировать одиночные и парные теги с помощью модуля Tag.
```ruby
HexletCode::Tag.build('br')
# <br>

HexletCode::Tag.build('img', src: 'path/to/image')
# <img src="path/to/image">

HexletCode::Tag.build('input', type: 'submit', value: 'Save')
# <input type="submit" value="Save">

# Для парных тегов тело передается как блок
HexletCode::Tag.build('label') { 'Email' }
# <label>Email</label>

HexletCode::Tag.build('label', for: 'email') { 'Email' }
# <label for="email">Email</label>

HexletCode::Tag.build('div')
# <div></div>
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/DmitriyKosnikov/hexlet_code.
