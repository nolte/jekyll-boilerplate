source "https://rubygems.org"
#ruby RUBY_VERSION

# Hello! This is where you manage which Jekyll version is used to run.
# When you want to use a different version, change it below, save the
# file and run `bundle install`. Run Jekyll with `bundle exec`, like so:
#
#     bundle exec jekyll serve
#
# This will help ensure the proper Jekyll version is running.
# Happy Jekylling!
gem "jekyll"
gem 'rake'
# If you want to use GitHub Pages, remove the "gem "jekyll"" above and
# uncomment the line below. To upgrade, run `bundle update github-pages`.
# gem "github-pages", group: :jekyll_plugins

group :build_plugins do

  gem 'rack-jekyll'
  gem 'html-proofer'
  gem 'rubocop'
  gem 'activesupport'
  gem 'stringex'
  gem 'colorator'
  gem 'colorize'
end

group :heroku_plugins do
  gem 'puma'
end

# If you have any plugins, put them here!
group :jekyll_plugins do
   gem 'jemoji'
   gem "jekyll-feed", "~> 0.6"
   gem 'bootstrap', '~> 4.0.0.alpha6'
   gem 'autoprefixer-rails'
   gem 'jekyll-assets'
   gem 'jekyll-archives'
   gem 'jekyll-last-modified-at'
   gem 'jekyll-plantuml'
   gem 'jekyll-mentions'
   gem 'jekyll-redirect-from'
   gem 'jekyll-sitemap'
   gem 'jekyll-paginate'
   gem 'jekyll-time-to-read'
   gem 'jekyll-watch'
   gem 'jekyll-categories'
   gem 'jekyll-sass-converter'
   gem 'jekyll-coffeescript'
   gem "minima", "~> 2.0"
   gem 'kramdown'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
