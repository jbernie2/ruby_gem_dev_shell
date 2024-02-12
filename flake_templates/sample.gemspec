Gem::Specification.new do |spec|
  spec.name                  = 'sample'
  spec.version               = "0.0.0"
  spec.authors               = ['Your name here']
  spec.email                 = ['your.email@here']
  spec.summary               = 'one line description here'
  spec.description           = <<~DOC
    longer description of the gem goes here
  DOC
  spec.homepage              = 'https://github.com' # usually a link to gem's github repo
  spec.license               = 'MIT'
  spec.platform              = Gem::Platform::RUBY
  spec.required_ruby_version = '>= 3.0.0'
  spec.files = Dir[
    # 'sample.gemspec', change this to your real gemspec file name once you
    # have one
    'README.md',
    'LICENSE',
    'CHANGELOG.md',
    'lib/**/*.rb',
    '.github/*.md',
    'Gemfile'
  ]
  #spec.add_dependency "depedency name", "~> 1.10"
  #spec.add_development_dependency "development dependency name", "~> 3.10"
end
