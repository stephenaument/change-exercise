class Change
  class << self
    def generate(denominations, change)
      denominations = denominations.sort.take_while do |denomination| 
        denomination <= change
      end.reverse

      solutions = denominations.map do |denomination|
        binding.pry
        get_solution(denominations.reverse.take_while do |_denomination|
          _denomination <= denomination
        end.reverse, change)
      end.compact

      solutions.min_by(&:count)
    end

    def get_solution(denominations, change)
      coin = denominations.shift
      remaining_change = change

      coins = []

      while remaining_change > 0 && coin != nil
        if coin <= remaining_change
          coins << coin
          remaining_change -= coin
        else
          coin = denominations.shift
        end
      end

      if coins.sum == change
        coins.reverse
      else
        nil
      end
    end
  end
end



__END__

[10, 5, 2] =.> [10, 10] -> 20 % 1  => nil

[10, 5, 2] =>  [10, 5, 2, 2, 2]

