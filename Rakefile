# encoding: utf-8
# coding: utf-8

require 'colorize'
require 'html-proofer'
require 'jekyll'
require 'rubocop/rake_task'
require 'uri'
# config.encoding = "utf-8"

Encoding.default_external = Encoding::UTF_8

Encoding.default_internal = Encoding::UTF_8

# Do not touch below this line
# RuboCop::RakeTask.new
ENV['JEKYLL_DESTINATION'] = '_site'
# Extend string to allow for bold text.
class String
  def bold
    "\033[1m#{self}\033[0m"
  end
end

# Rake Jekyll tasks
task :build do
  puts 'Building site...'.yellow.bold
  if ENV['JEKYLL_WATCH'] == 'true'
    opts = { profile: true, destination: ENV['JEKYLL_DESTINATION'], watch: '' }
  else
    opts = { profile: true, destination: ENV['JEKYLL_DESTINATION'] }
  end

  puts opts.to_s.yellow.bold
  Jekyll::Commands::Build.process(opts)
end

task :clean do
  puts 'Cleaning up _site...'.yellow.bold
  Jekyll::Commands::Clean.process({})
end

task :html_proofer do
  Rake::Task['build'].invoke
  puts 'Running html proofer...'.yellow.bold
  url_swap = { %r{^\/jekyll-site\/} => '/' }
  url_ignore = []

  url_ignore.push 'jekyllrb.com' # ssl check fail on travisci
  opts = { log_level: ':debug',
           url_ignore: url_ignore,
           url_swap: url_swap,
           :check_sri => false,
           :check_external_hash => true,
           :check_html => true,
           :check_img_http => true,
           :check_opengraph => true,
           :enforce_https => true,
           :typhoeus => { :verbose => true, :ssl_verifyhost => 2 }
          }
  #HTMLProofer.check_directory(ENV['JEKYLL_DESTINATION'], opts).run
  HTMLProofer.check_directory(ENV['JEKYLL_DESTINATION'], opts
  ).run
end
