require_relative '../lib/inverse_captcha'

describe InverseCaptcha do
  describe '#consecutive_sum' do
    context 'no consecutive digits' do
      it 'returns 0 for \'1234\'' do
        inverse_captcha = InverseCaptcha.new
        expect(inverse_captcha.consecutive_sum('1234')).to eq(0)
      end

      it 'returns 0 for \'4321\'' do
        inverse_captcha = InverseCaptcha.new
        expect(inverse_captcha.consecutive_sum('4321')).to eq(0)
      end
    end

    context 'a single consecutive digit' do
      it 'returns 1 when only consecutive digit is \'1\'' do
        inverse_captcha = InverseCaptcha.new
        expect(inverse_captcha.consecutive_sum('1123')).to eq(1)
      end

      it 'returns 2 when only consecutive digit is \'2\'' do
        inverse_captcha = InverseCaptcha.new
        expect(inverse_captcha.consecutive_sum('1223')).to eq(2)
      end
    end

    context 'a single circular consecutive digit' do
      it 'returns 1 when only circular consecutive digit is \'1\'' do
        inverse_captcha = InverseCaptcha.new
        expect(inverse_captcha.consecutive_sum('1231')).to eq(1)
      end

      it 'returns 2 when only circular consecutive digit is \'2\'' do
        inverse_captcha = InverseCaptcha.new
        expect(inverse_captcha.consecutive_sum('2312')).to eq(2)
      end
    end

    context 'multiple consecutive digits' do
      it 'returns sum of all consecutive digits' do
        inverse_captcha = InverseCaptcha.new
        expect(inverse_captcha.consecutive_sum('1122')).to eq(3)
      end

      it 'returns sum of all consecutive digits including circular matches' do
        inverse_captcha = InverseCaptcha.new
        expect(inverse_captcha.consecutive_sum('1221')).to eq(3)
      end
    end
  end

  describe '#halfway_sum' do
    it 'returns 6 for \'1212\'' do
      inverse_captcha = InverseCaptcha.new
      expect(inverse_captcha.halfway_sum('1212')).to eq(6)
    end
  end
end
