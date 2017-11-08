# Rotate development and test log files when they exceed 5 MB. Otherwise logs
# will grow unbounded into gigabytes over the life of a project.
if Rails.env.development? || Rails.env.test?
  log_file = Rails.root.join("log", "#{Rails.env}.log")

  if log_file.file? && log_file.size > 5_000_000
    FileUtils.cp(log_file, "#{log_file}.1")
    log_file.truncate(0)
  end
end
