require 'rubygems'
require 'rake'
require 'rubygems/package_task'

$:.push File.expand_path('../lib', __FILE__)
require 'tinymce/rails/version'

gemspec = eval(File.read('locomotive-tinymce-rails.gemspec'))
Gem::PackageTask.new(gemspec) do |pkg|
  pkg.gem_spec = gemspec
end

desc 'build the gem and release it to rubygems.org'
task :release => :gem do
  sh "gem push pkg/locomotive-tinymce-rails-#{TinyMCE::Rails::VERSION}.gem"
end

def step(name)
  print "#{name} ..."
  yield
  puts " DONE"
end

def download(url, filename, params = nil)
  puts "Downloading #{url} ..."
  form = params.nil? ? ' ' : "--data '#{params}'"
  cmd = "curl #{form} -# -L '#{url}' -o tmp/#{filename}"
  `mkdir -p tmp`
  `#{cmd}`
end

desc "Update TinyMCE to version specified in lib/tinymce/version.rb"
task :update => [ :fetch, :extract, :process ]

task :fetch do
  download("https://github.com/downloads/tinymce/tinymce/tinymce_#{TinyMCE::VERSION}_jquery.zip", "tinymce.jquery.zip")

  params = 'la_export=js&' + %w(de en es et fr it nl nb pl pt ru).map { |l| "la[]=#{l}" }.join('&')
  download("http://www.tinymce.com/i18n/index.php?ctrl=export&act=zip", 'tinymce_language_pack.zip', params)
end

task :extract do
  step "Extracting files" do
    `rm -rf tmp/tinymce`
    `unzip -u tmp/tinymce.jquery.zip -d tmp`
    `rm -rf vendor/assets/javascripts/tinymce`
    `mv tmp/tinymce/jscripts/tiny_mce vendor/assets/javascripts/tinymce`
  end

  step "Extracting locales" do
    `rm -rf tmp/tinymce_language_pack`
    `unzip -u tmp/tinymce_language_pack.zip -d tmp`
    `cp -R tmp/tinymce_language_pack/* vendor/assets/javascripts/tinymce/.`
  end
end

task :process do
  step "Fixing file encoding" do
    Dir["vendor/assets/javascripts/tinymce/**/*.js"].each do |file|
      contents = File.read(file).encode('UTF-8', 'ISO-8859-1')
      File.open(file, 'w') { |f| f.write(contents) }
    end
  end
end
