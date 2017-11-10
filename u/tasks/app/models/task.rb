class Task
	def initialize(params)
		@date = params[:date]
		@text = params[:text]
	end

#__	
	def date
		@date	
	end

	def text
		@text	
	end
#__

	def save
		dc = DatabaseConnector.new
		dc.save_task(self)
	end
end

class DatabaseConnector	
	def initialize
		@db ||= SQLite3::Database.new "./db/tasks.sqlite"			
	end

	def save_task(task)
		@db.execute("INSERT INTO tasks(date, text) VALUES (?,?)", task.date, task.text)
	end
end

