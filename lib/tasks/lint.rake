desc "Run all linters"
task lint: "lint:all"

namespace :lint do
  task all: %i[rubocop slim_lint]

  begin
    require "rubocop/rake_task"

    RuboCop::RakeTask.new
  rescue LoadError # rubocop:disable Lint/HandleExceptions
  end

  desc "Lint slim files"
  task :slim_lint do
    puts "Running slim-lint..."
    sh "RUBYOPT=-W0 bin/slim-lint **/*.slim"
    puts "No slim offenses detected"
  end
end
