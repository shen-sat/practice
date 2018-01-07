class Controller
	attr_reader :plateau
	def initialize
		@plateau = nil
	end

	def read_plateau(plateau_str)
		input_parser = InputParser.new
		plateau_input = input_parser.validate_plateau(plateau_str)	
		@plateau = Plateau.new(plateau_input[0], plateau_input[1])
	end

	def read_rover_commands
		res = ""
		loop do
				parser = InputParser.new
				pos_str = gets.chomp	
				break if pos_str == ""
				pos_input = parser.validate_start_pos(pos_str)
				instruct = gets.chomp
				res += Rover.new(pos_input[0], pos_input[1], pos_input[2], parser.validate_instruct(instruct)).end_position + "\n"
			end
		res
	end

	

	def read_start_pos(n)
		parser = InputParser.new
		@pos_input = parser.validate_start_pos(n)
	end

	def read_instructions
		@res = ""
		parser = InputParser.new
		instruct = gets.chomp
		@res += Rover.new(@pos_input[0], @pos_input[1], @pos_input[2], parser.validate_instruct(instruct)).end_position + "\n"
	end

	def first_input
		begin
			read_plateau(gets.chomp)
		rescue RuntimeError => err
			puts "#{err}: please try again"
			first_input
		end
	end

	def second_input
		begin
			@end = false
			n = gets.chomp
			@end = true if n == ""
			read_start_pos(n) unless @end
		rescue RuntimeError => err
			puts "#{err}: please try again"
			second_input()
		end
	end

	def third_input
		begin
			read_instructions
		rescue RuntimeError => err
			puts "#{err}: please try again"
			third_input
		end
	end

	def run_app_v2
		first_input
		loop do
			second_input
			break if @end
			third_input
		end
		puts @res
	end

	def run_app
		puts "Please enter inputs line by line, followed by a new line at the end:"
		begin
			read_plateau(gets.chomp)
			puts read_rover_commands
		rescue RuntimeError => err
			puts "#{err}: Please try again"
			run_app
		end
	end
end
