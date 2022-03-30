module Exercise
  module Arrays
    class << self
      def replace(array)
        max_value = array.max
        array.map do |num|
          if num.positive?
            max_value
          else
            num
          end
        end
      end

      def search(_array, _query)
        guess_iter = lambda { |min, max|
          return -1 if max == 0

          slice_length = max + min
          guess = (slice_length / 2.0).floor

          if slice_length <= 2 
            if _array[guess] == _query
              return guess
            elsif _array[guess - 1] == _query
              return guess - 1
            else
              return -1
            end
          end
          
          if _array[guess] == _query
            return guess
          elsif _array[guess] > _query
            guess_iter.call(min, guess - 1)
          else
            guess_iter.call(guess + 1, max)
          end
        }
      
        guess_iter.call(0, _array.length)
      end
    end
  end
end
