class TaskView
  def initialize(tasks)
    @tasks = tasks
  end

  def print
    @tasks.each do |task|
      puts "ID:#{task[0]}\tDate: #{task[1]}\t\tTask: #{task[2]}\t\tStatus: #{task[3]}"
    end
  end
end
