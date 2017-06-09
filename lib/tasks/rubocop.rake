begin
  require "rubocop/rake_task"

  RuboCop::RakeTask.new

  task default: %i[spec rubocop]
rescue LoadError # rubocop:disable Lint/HandleExceptions
end
