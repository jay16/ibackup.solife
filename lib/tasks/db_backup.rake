namespace :db do  
  desc "Backup project database. Options: DIR=backups RAILS_ENV=production MAX=7" 
  namespace :backup do
    datestamp = Time.now.strftime("%Y-%m-%d_%H-%M-%S")    
    backup_folder = File.join(Rails.root, "db","backups")
    RAILS_ENV = "development"

    task :create => [:environment] do
      backup_file = File.join(backup_folder, "#{RAILS_ENV}_#{datestamp}_dump.sql")    
      FileUtils.mkdir_p(backup_folder) unless File.exist?(backup_folder)
      db_config = ActiveRecord::Base.configurations[RAILS_ENV]    
      `mysqldump -u #{db_config["username"]} -p#{db_config["password"]} -i -c -q #{db_config["database"]} > #{backup_file}`
      raise "Unable to make DB backup!" if ( $?.to_i > 0 )
      `gzip -9 #{backup_file}`
      puts "Created backup: #{backup_file}"     
    end

    task :destroy => [:environment] do
      dir = Dir.new(backup_folder)
      all_backups = dir.entries.sort[2..-1].reverse
      max_backups = (ENV["MAX"].to_i if ENV["MAX"].to_i > 0) || 7
      unwanted_backups = all_backups[max_backups..-1] || []
      for unwanted_backup in unwanted_backups
        FileUtils.rm_rf(File.join(backup_base, unwanted_backup))
      end
      puts "Deleted #{unwanted_backups.length} backups, #{all_backups.length - unwanted_backups.length} backups available" 
    end
  end
end
