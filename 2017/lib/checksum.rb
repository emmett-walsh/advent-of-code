class Checksum
  def calculate(data)
    rows = data.split("\n")
    rows.reduce(0) do |accumulator, row|
      accumulator + largest_value(row) - smallest_value(row)
    end
  end

  def sum_of_evenly_divisible_values(data)
    rows = data.split("\n")
    division_value = 0
    rows.each do |row|
      values(row).each_with_index do |value, value_index|
        values(row).each_with_index do |possible_divisor, possible_divisor_index|
          division_value += (value / possible_divisor) if evenly_divisible?(value, possible_divisor) && different_values?(value_index, possible_divisor_index)
        end
      end
    end
    division_value
  end

  private

  def largest_value(row)
    values(row).max
  end

  def smallest_value(row)
    values(row).min
  end

  def values(row)
    row.split(" ").map { |value| value.to_i }
  end

  def evenly_divisible?(value, possible_divisor)
    value % possible_divisor == 0
  end

  def different_values?(value_index, possible_divisor_index)
    value_index != possible_divisor_index
  end
end
