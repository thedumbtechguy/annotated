annotate_lib = File.expand_path(File.dirname(__FILE__, 2))

unless ENV["is_cli"]
  task :set_annotation_options
  task annotate_routes: :set_annotation_options
end

desc "Adds the route map to routes.rb"
task annotate_routes: :environment do
  require "#{annotate_lib}/annotate/annotate_routes"

  options = {}
  ENV["position"] = options[:position] = Annotated::Helpers.fallback(ENV["position"], "before")
  options[:position_in_routes] = Annotated::Helpers.fallback(ENV["position_in_routes"], ENV["position"])
  options[:ignore_routes] = Annotated::Helpers.fallback(ENV["ignore_routes"], nil)
  options[:require] = ENV["require"] ? ENV["require"].split(",") : []
  options[:frozen] = Annotated::Helpers.true?(ENV["frozen"])
  options[:wrapper_open] = Annotated::Helpers.fallback(ENV["wrapper_open"], ENV["wrapper"])
  options[:wrapper_close] = Annotated::Helpers.fallback(ENV["wrapper_close"], ENV["wrapper"])
  AnnotateRoutes.do_annotations(options)
end

desc "Removes the route map from routes.rb"
task remove_routes: :environment do
  annotate_lib = File.expand_path(File.dirname(__FILE__, 2))
  require "#{annotate_lib}/annotate/annotate_routes"

  options = {}
  options[:require] = ENV["require"] ? ENV["require"].split(",") : []
  AnnotateRoutes.remove_annotations(options)
end
