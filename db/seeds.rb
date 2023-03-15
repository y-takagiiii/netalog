tables = %w[users admin_notifications videos posts laugh_logs]


tables.each do |table|
  path = Rails.root.join("db/seeds/#{Rails.env}/#{table}.rb")
  path = path.sub(Rails.env, 'development') unless File.exist?(path)
  puts "#{table} created"
  require path
end
