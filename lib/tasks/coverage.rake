namespace :spec do
  task enable_coverage: :environment do
    ENV["COVERAGE"] = "1"
  end

  desc "Executes specs with code coverage reports"
  task coverage: :enable_coverage do
    Rake::Task[:spec].invoke
  end
end
