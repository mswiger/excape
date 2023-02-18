Gem::Specification.new do |s|
  s.name                  = "excape"
  s.version               = "0.1.0"
  s.summary               = "Wofi wrapper for system exit menu"
  s.description           = "A Wofi wrapper that implements a system shutdown/exit menu."
  s.authors               = ["Michael Swiger"]
  s.email                 = "michael@swiger.dev"
  s.files                 = ["lib/excape.rb"]
  s.homepage              = "https://rubygems.org/gems/excape"
  s.license               = "MIT"
  s.required_ruby_version = ">= 3.0"

  s.executables << "excape"
end
