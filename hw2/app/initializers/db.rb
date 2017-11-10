class DatabaseInitializer

  def check_database
    init_database unless database_exists?
  end

  private

  def database_exists?
    File.exist?("./db/tasks.sqlite")
  end

  def init_database
    db.execute <<-SQL
      create table tasks (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        date TEXT,
        text TEXT,
        done INTEGER
      );
    SQL
  end

  def db
    @db ||= SQLite3::Database.new "./db/tasks.sqlite"
  end
end
