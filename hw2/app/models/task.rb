class Task < BaseModel

  def initialize(params)
    @id   = params[:id] || nil
    @date = parsed_date(params[:date])
    @text = params[:text]
    @done = 0
  end

  def parsed_date(date)
    result = if date == 'today'
      Date.today.strftime("%Y-%m-%d")
    elsif date == 'tomorrow'
      (Date.today + 1).strftime("%Y-%m-%d")
    else
      date
    end

    result
  end

  def self.find(task_id)
    result = db.execute("SELECT * FROM tasks WHERE ID = ?", task_id).first
    Task.new({ id: result[0], date: result[1], text: result[2] })
  end

  def destroy
    db.execute("DELETE FROM tasks WHERE id = ?", @id)
  end

  def self.all
    db.execute("SELECT * FROM tasks;")
  end

  def self.show
    db.execute("SELECT * FROM tasks WHERE date <= date('now') AND done = 0;")
  end

  def done
    db.execute("UPDATE tasks SET done = 1 WHERE id = ?", @id)
  end
end
