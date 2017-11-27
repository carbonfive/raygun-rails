# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path("../config/application", __FILE__)

AppPrototype::Application.load_tasks

if Rails.env.development? || Rails.env.test?
  Rake::Task[:default].clear_prerequisites
  task default: %i[spec rubocop]
end
