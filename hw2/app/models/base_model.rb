class BaseModel
  def save
    send "save_#{self.class.to_s.downcase}"
  end

  def save_task
    db.execute "INSERT INTO tasks (date, text, done) VALUES (?,?,?)", @date, @text, 0
  end

  def self.db
    @db ||= SQLite3::Database.new "./db/tasks.sqlite"
  end

  def db
    @db ||= SQLite3::Database.new "./db/tasks.sqlite"
  end
end
