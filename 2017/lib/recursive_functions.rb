class RecursiveFunctions
  def reverse(string)
    return string if string.length == 1
    reverse(string[1..-1]) + string[0]
  end

  def print_elements(array)
    if array.length == 1
      p array[0]
    else
      p array.shift
      print_elements(array)
    end
  end

  def pallindrome?(string)
    return true if string.length < 2
    pallindrome?(string[1..-2]) && string[0] == string[-1]
  end

  def exponentiate(base, exponent)
    return 1 if exponent == 0
    exponentiate(base, exponent - 1) * base
  end
end
