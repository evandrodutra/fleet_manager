module FleetManager
  class Calculator
    def self.call(*args)
      new(*args).calculate
    end

    def initialize(vehicles, c, p)
      @vehicles = vehicles
      @c = c
      @p = p
    end

    def calculate
      min_fe
    end

    private

    def min_fe
      max_fe_retained = 0

      @vehicles.each do |v|
        max_fe_retained = max_fe(max_fe_retained, v)
      end

      total_fe - max_fe_retained
    end

    def max_fe(num_max, amount)
      return 0 unless num_max < fm_fe_ratio

      [num_max, fe_retained(amount)].max
    end

    def total_fe
      @vehicles.map { |v| fe_ratio(v) }.inject(:+)
    end

    def fe_ratio(dividend)
      (dividend / @p.to_f).ceil
    end

    def fm_fe_ratio
      (@c / @p.to_f).ceil
    end

    def fe_retained(amount)
      fe_ratio(amount) - ([0, (amount - @c)].max / @p.to_f).ceil
    end
  end
end
