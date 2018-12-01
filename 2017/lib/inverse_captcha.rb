class InverseCaptcha
  def consecutive_sum(captcha)
    determine_consecutive_digits(captcha)
  end

  def halfway_sum(captcha)
    determine_midpoint_matching_digits(captcha)
  end

  private

  def determine_consecutive_digits(captcha)
    subtotal = 0
    previous_number = captcha[-1]
    captcha.each_char do |number|
      if number == previous_number
        subtotal += number.to_i
      end
      previous_number = number
    end
    return subtotal
  end

  def determine_midpoint_matching_digits(captcha)
    subtotal = 0
    captcha.each_char.with_index do |number, index|
      if number == number_halfway_round(captcha, index)
        subtotal += number.to_i
      end
    end
    return subtotal
  end

  def number_halfway_round(captcha, index)
    captcha[index - (captcha.length / 2)]
  end
end
