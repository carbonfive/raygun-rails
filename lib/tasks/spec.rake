begin
  require "rspec/core"
  require "rspec/core/rake_task"

  namespace :spec do
    desc "Run the code examples in spec/ except those in spec/system"
    RSpec::Core::RakeTask.new(:without_system) do |t|
      t.exclude_pattern = "spec/system/**/*_spec.rb"
    end
  end
rescue LoadError
  namespace :spec do
    task :without_system do
    end
  end
end
