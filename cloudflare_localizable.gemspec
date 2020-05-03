# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'cloudflare_localizable/version'

Gem::Specification.new do |spec|
  spec.name          = 'cloudflare_localizable'
  spec.version       = CloudFlareLocalizable::VERSION
  spec.authors       = ['Ricardo Otero']
  spec.email         = ['oterosantos@gmail.com']

  spec.summary       = 'Localize your requests with CloudFlare.'
  spec.description   = "If you're using CloudFlare you can easily get the location of your requests
                        based on a special header that CloudFlare attaches to every request."
  spec.homepage      = 'https://github.com/rikas/cloudflare_localizable'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'actionpack'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake', '>= 13.0.1'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
end
