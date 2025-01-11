annotate_lib = File.expand_path(File.dirname(__FILE__, 2))

unless ENV["is_cli"]
  task :set_annotation_options
  task annotate_models: :set_annotation_options
end

desc "Add schema information (as comments) to model and fixture files"
task annotate_models: :environment do
  require "#{annotate_lib}/annotated/annotate_models"
  require "#{annotate_lib}/annotated/active_record_patch"

  options = {is_rake: true}
  ENV["position"] = options[:position] = Annotated::Helpers.fallback(ENV["position"], "before")
  options[:additional_file_patterns] = ENV["additional_file_patterns"] ? ENV["additional_file_patterns"].split(",") : []
  options[:position_in_class] = Annotated::Helpers.fallback(ENV["position_in_class"], ENV["position"])
  options[:position_in_fixture] = Annotated::Helpers.fallback(ENV["position_in_fixture"], ENV["position"])
  options[:position_in_factory] = Annotated::Helpers.fallback(ENV["position_in_factory"], ENV["position"])
  options[:position_in_test] = Annotated::Helpers.fallback(ENV["position_in_test"], ENV["position"])
  options[:position_in_serializer] = Annotated::Helpers.fallback(ENV["position_in_serializer"], ENV["position"])
  options[:show_check_constraints] = Annotated::Helpers.true?(ENV["show_check_constraints"])
  options[:show_foreign_keys] = Annotated::Helpers.true?(ENV["show_foreign_keys"])
  options[:show_complete_foreign_keys] = Annotated::Helpers.true?(ENV["show_complete_foreign_keys"])
  options[:show_indexes] = Annotated::Helpers.true?(ENV["show_indexes"])
  options[:simple_indexes] = Annotated::Helpers.true?(ENV["simple_indexes"])
  options[:model_dir] = ENV["model_dir"] ? ENV["model_dir"].split(",") : ["app/models"]
  options[:root_dir] = ENV["root_dir"]
  options[:include_version] = Annotated::Helpers.true?(ENV["include_version"])
  options[:require] = ENV["require"] ? ENV["require"].split(",") : []
  options[:exclude_tests] = Annotated::Helpers.true?(ENV["exclude_tests"])
  options[:exclude_factories] = Annotated::Helpers.true?(ENV["exclude_factories"])
  options[:exclude_fixtures] = Annotated::Helpers.true?(ENV["exclude_fixtures"])
  options[:exclude_serializers] = Annotated::Helpers.true?(ENV["exclude_serializers"])
  options[:exclude_scaffolds] = Annotated::Helpers.true?(ENV["exclude_scaffolds"])
  options[:exclude_controllers] = Annotated::Helpers.true?(ENV.fetch("exclude_controllers", "true"))
  options[:exclude_helpers] = Annotated::Helpers.true?(ENV.fetch("exclude_helpers", "true"))
  options[:exclude_sti_subclasses] = Annotated::Helpers.true?(ENV["exclude_sti_subclasses"])
  options[:ignore_model_sub_dir] = Annotated::Helpers.true?(ENV["ignore_model_sub_dir"])
  options[:format_bare] = Annotated::Helpers.true?(ENV["format_bare"])
  options[:format_rdoc] = Annotated::Helpers.true?(ENV["format_rdoc"])
  options[:format_yard] = Annotated::Helpers.true?(ENV["format_yard"])
  options[:format_markdown] = Annotated::Helpers.true?(ENV["format_markdown"])
  options[:sort] = Annotated::Helpers.true?(ENV["sort"])
  options[:force] = Annotated::Helpers.true?(ENV["force"])
  options[:frozen] = Annotated::Helpers.true?(ENV["frozen"])
  options[:classified_sort] = Annotated::Helpers.true?(ENV["classified_sort"])
  options[:trace] = Annotated::Helpers.true?(ENV["trace"])
  options[:wrapper_open] = Annotated::Helpers.fallback(ENV["wrapper_open"], ENV["wrapper"])
  options[:wrapper_close] = Annotated::Helpers.fallback(ENV["wrapper_close"], ENV["wrapper"])
  options[:ignore_columns] = ENV.fetch("ignore_columns", nil)
  options[:ignore_routes] = ENV.fetch("ignore_routes", nil)
  options[:hide_limit_column_types] = Annotated::Helpers.fallback(ENV["hide_limit_column_types"], "")
  options[:hide_default_column_types] = Annotated::Helpers.fallback(ENV["hide_default_column_types"], "")
  options[:with_comment] = Annotated::Helpers.true?(ENV["with_comment"])
  options[:with_comment_column] = Annotated::Helpers.true?(ENV["with_comment_column"])
  options[:ignore_unknown_models] = Annotated::Helpers.true?(ENV.fetch("ignore_unknown_models", "false"))

  AnnotateModels.do_annotations(options)
end

desc "Remove schema information from model and fixture files"
task remove_annotation: :environment do
  require "#{annotate_lib}/annotated/annotate_models"
  require "#{annotate_lib}/annotated/active_record_patch"

  options = {is_rake: true}
  options[:model_dir] = ENV["model_dir"]
  options[:root_dir] = ENV["root_dir"]
  options[:require] = ENV["require"] ? ENV["require"].split(",") : []
  options[:trace] = Annotated::Helpers.true?(ENV["trace"])
  AnnotateModels.remove_annotations(options)
end
