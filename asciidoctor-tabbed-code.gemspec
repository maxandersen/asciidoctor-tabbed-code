lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "asciidoctor-tabbed-code/version"

Gem::Specification.new do |spec|
  spec.name          = "asciidoctor-tabbed-code"
  spec.version       = Asciidoctor::Tabbed::Code::VERSION
  spec.authors       = ["Max Rydahl Andersen"]
  spec.email         = ["max@xam.dk"]

  spec.summary       = %q{An Asciidoctor extension for rendering code on multiple tabs}
  spec.description   = %q{This Asciidoctor extension can render code on multiple tabs. The functionality is particularly useful if you want to demonstrate a code example in different languages or tools}
  spec.homepage      = "https://github.com/maxandersen/asciidoctor-tabbed-code"
  spec.license       = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage + "/CHANGELOG.adoc"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"

  spec.add_runtime_dependency 'asciidoctor', '>= 1.5.7', '< 3.x'

end
