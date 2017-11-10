class Happy_Checker 
	def initialize(t)
      @ticket = t
   	end

	def is_happy
		ticket = @ticket.to_i
		ticket1 = ticket / 1000
		ticket2 = ticket % 1000
		check = true
		ticketsum1 = 0
		ticketsum2 = 0
		for i in 0..2 
			ticketsum1 += ticket1 % 10
			ticket1 = ticket1 / 10
		end

		for i in 0..2 
			ticketsum2 += ticket2 % 10
			ticket2 = ticket2 / 10
			if ticketsum2 > ticketsum1 then
				check = false
				break
			end
		end

		puts check
	end
end


class String
  def is_integer?
    /\A[-+]?\d+\z/ === self
  end
end

puts  "Print the ticket number"
ticket = gets
if  ticket.length - 1 == 6 &&  ticket.slice(0,ticket.length-1).is_integer?
	happy_Checker  = Happy_Checker.new(ticket)
	happy_Checker.is_happy
elsif puts  "It isn't a number or it hasn't 6 digits"
end
