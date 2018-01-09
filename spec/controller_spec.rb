require_relative '../lib/controller.rb'

describe 'controller' do 
	it 'should parse plateau' do 
		controller = Controller.new
		controller.read_plateau("5 6")
		expect(controller.plateau.width).to eq(5)
		expect(controller.plateau.height).to eq(6)
	end

	it 'should return error if instructions go beyond plateau border' do 
		controller = Controller.new
		controller.read_plateau("5 5")
		#controller.read_rover_commands("1 2 N", "LR")
		expect{controller.read_rover_commands("1 2 N", "MMMMMMMM")}.to raise_error(RuntimeError, "Rover will move beyond plateau")
	end


end