begin
  require "rspec/core"
  require "rspec/core/rake_task"

  namespace :spec do
    desc "Run the code examples in spec/ except those in spec/features"
    RSpec::Core::RakeTask.new(:without_features) do |t|
      t.exclude_pattern = "spec/features/**/*_spec.rb"
    end

    desc "Run Jest Javascript tests"
    task javascripts: [:environment] do
      exit($?.exitstatus) unless system("jest")
    end
  end
rescue LoadError
  namespace :spec do
    task :without_features do
    end
  end
end
