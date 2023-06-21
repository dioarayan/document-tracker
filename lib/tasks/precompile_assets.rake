namespace :assets do
  task :precompile_if_changed do
    if should_precompile_assets?
      puts "Precompiling assets..."
      system('rails assets:precompile')
    else
      puts "Skipping asset precompilation."
    end
  end

  def should_precompile_assets?
    matching_files.blank? || assets_changed?
  end

  def assets_changed?
    # Compare the timestamp of the latest asset with the timestamp of the manifest file
    latest_asset_timestamp = Dir.glob('app/assets/**/*').map { |file| File.mtime(file) }.max
    manifest_timestamp = File.mtime(matching_files.first)
    latest_asset_timestamp > manifest_timestamp
  end

  def matching_files
    pattern = Rails.root.join('public/assets/.sprockets-manifest-*.json')
    Dir.glob(pattern)
  end
end
