require "bundler/gem_tasks"

require "rspec/core/rake_task" # RSpec 2.0
RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = ["spec/*_spec.rb", "spec/**/*_spec.rb"]
  t.rspec_opts = ["--backtrace", "--format d"]
end

# want other tests/tasks run by default? Add them to the list
task default: [:spec]
