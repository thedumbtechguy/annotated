# frozen_string_literal: true

require_relative "lib/annotated/version"

Gem::Specification.new do |spec|
  spec.name = "annotated"
  spec.version = Annotated.version
  spec.authors = [
    "Stefan Froelich",
    "Alex Chaffee",
    "Cuong Tran",
    "Marcos Piccinini",
    "Turadg Aleahmad",
    "Jon Frisby"
  ]
  spec.email = [
    "sfroelich01@gmail.com",
    "alex@stinky.com",
    "cuong.tran@gmail.com",
    "x@nofxx.com",
    "turadg@aleahmad.net",
    "jon@cloudability.com"
  ]

  spec.summary = "Annotates Rails Models, routes, fixtures, and others based on the database schema."
  spec.description = "Annotates Rails/ActiveRecord Models, routes, fixtures, and others based on the database schema."
  spec.homepage = "https://github.com/thedumbtechguy/annotated"
  spec.license = "Ruby"
  spec.required_ruby_version = ">= 3.2"

  spec.metadata = {
    "homepage_uri" => spec.homepage,
    "bug_tracker_uri" => "https://github.com/thedumbtechguy/annotated/issues",
    "documentation_uri" => "https://github.com/thedumbtechguy/annotated",
    "source_code_uri" => "https://github.com/thedumbtechguy/annotated",
    "changelog_uri" => "https://github.com/thedumbtechguy/annotated/blob/master/CHANGELOG.md"
  }

  spec.files = Dir.glob(%w[LICENSE.txt *.md *.gemspec bin/* lib/**/*])
  spec.bindir = "bin"
  spec.executables = ["annotated"]
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", ">= 3.2"
end
