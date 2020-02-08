task :kill_postgres_connections => :environment do
  db_name = "#{File.basename(Rails.root)}_#{Rails.env}"
  sh = <<EOF
ps xa \
  | grep postgres: \
  | grep #{ActiveRecord::Base.connection.current_database} \
  | grep -v grep \
  | awk '{print $1}' \
  | sudo xargs kill
EOF
  puts 'Terminating PG connection to drop DB: Expect FATAL 👌👌👌'
  puts `#{sh}`
end

task "db:drop" => :kill_postgres_connections