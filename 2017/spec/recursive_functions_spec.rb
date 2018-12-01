require_relative "../lib/recursive_functions.rb"

describe RecursiveFunctions do
  describe "#reverse" do
    context "single character strings" do
      it "returns 'a' when passed 'a'" do
        recursive_functions = RecursiveFunctions.new
        expect(recursive_functions.reverse("a")).to eq("a")
      end

      it "returns 'b' when passed 'b'" do
        recursive_functions = RecursiveFunctions.new
        expect(recursive_functions.reverse("b")).to eq("b")
      end
    end

    context "multiple character strings" do
      it "returns 'ba' when passed 'ab'" do
        recursive_functions = RecursiveFunctions.new
        expect(recursive_functions.reverse("ab")).to eq("ba")
      end
    end
  end

  describe "#print_elements" do
    it "prints a single element array" do
      recursive_functions = RecursiveFunctions.new
      expect { recursive_functions.print_elements([1]) }.to output("1\n").to_stdout
    end

    it "prints all elements of an array" do
      recursive_functions = RecursiveFunctions.new
      expect { recursive_functions.print_elements([1, 2]) }.to output("1\n2\n").to_stdout
    end

    it "prints all elements of a longer array" do
      recursive_functions = RecursiveFunctions.new
      expect { recursive_functions.print_elements([1, 2, 3]) }.to output("1\n2\n3\n").to_stdout
    end
  end

  describe "#palindrome?" do
    it "returns true for single character strings" do
      recursive_functions = RecursiveFunctions.new
      expect(recursive_functions.pallindrome?("a")).to be(true)
    end

    it "returns true for multiple character palindrome strings" do
      recursive_functions = RecursiveFunctions.new
      expect(recursive_functions.pallindrome?("abba")).to be(true)
    end
  end

  describe "#exponentiate" do
    it "returns 1 when exponent is 0" do
      recursive_functions = RecursiveFunctions.new
      expect(recursive_functions.exponentiate(1, 0)).to eq(1)
    end

    it "returns value of base raised to power of exponent when exponent is greater than 0" do
      recursive_functions = RecursiveFunctions.new
      expect(recursive_functions.exponentiate(2, 3)).to eq(8)
    end
  end
end
