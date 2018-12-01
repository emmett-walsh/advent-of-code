require_relative "../lib/spiral_memory.rb"

describe SpiralMemory do
  describe "#steps_to_access_port" do
    it "returns 0 when address 1 is given" do
      spiral_memory = SpiralMemory.new
      expect(spiral_memory.steps_to_access_port(1)).to eq(0)
    end

    it "returns 1 when address 2 is given" do
      spiral_memory = SpiralMemory.new
      expect(spiral_memory.steps_to_access_port(2)).to eq(1)
    end

    it "returns 3 when address 12 is given" do
      spiral_memory = SpiralMemory.new
      expect(spiral_memory.steps_to_access_port(12)).to eq(3)
    end

    it "returns 2 when address 23 is given" do
      spiral_memory = SpiralMemory.new
      expect(spiral_memory.steps_to_access_port(23)).to eq(2)
    end

    it "returns 31 when address 1024 is given" do
      spiral_memory = SpiralMemory.new
      expect(spiral_memory.steps_to_access_port(1024)).to eq(31)
    end

    # it "returns ??? when address 368078 is given" do
    #   spiral_memory = SpiralMemory.new
    #   expect(spiral_memory.steps_to_access_port(368078)).to eq(371)
    # end
  end

  describe "#find_first_value_larger_than" do
    it "returns 1 when given 0" do
      spiral_memory = SpiralMemory.new
      expect(spiral_memory.find_first_value_larger_than(0)).to eq(1)
    end

    it "returns 2 when given 1" do
      spiral_memory = SpiralMemory.new
      expect(spiral_memory.find_first_value_larger_than(1)).to eq(2)
    end

    it "returns 4 when given 2" do
      spiral_memory = SpiralMemory.new
      expect(spiral_memory.find_first_value_larger_than(2)).to eq(4)
    end

    it "returns 11 when given 10" do
      spiral_memory = SpiralMemory.new
      expect(spiral_memory.find_first_value_larger_than(10)).to eq(11)
    end

    it "returns 806 when given 747" do
      spiral_memory = SpiralMemory.new
      expect(spiral_memory.find_first_value_larger_than(747)).to eq(806)
    end
  end
end
