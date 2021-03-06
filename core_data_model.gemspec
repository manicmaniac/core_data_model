# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'core_data_model/version'

Gem::Specification.new do |spec|
  spec.name          = 'core_data_model'
  spec.version       = CoreDataModel::VERSION
  spec.authors       = ['Ryosuke Ito']
  spec.email         = ['rito.0305@gmail.com']

  spec.summary       = 'Swift code generator for Core Data models.'
  spec.homepage      = 'https://github.com/manicmaniac/core_data_model'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'activesupport', '~> 4.0'
  spec.add_runtime_dependency 'oga', '~> 2.2'
  spec.add_runtime_dependency 'plist', '~> 3.2'
  spec.add_runtime_dependency 'sax-machine', '~> 1.3.2'
  spec.add_runtime_dependency 'thor', '~> 0.19.1'
  spec.add_runtime_dependency 'wannabe_bool', '~> 0.5'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'minitest-reporters'
  spec.add_development_dependency 'rubocop', '0.37.2'
end
