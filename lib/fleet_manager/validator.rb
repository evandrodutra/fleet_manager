module FleetManager
  class ValidationError < StandardError; end

  class Validator
    def self.call(*args)
      new(*args).validate
    end

    def initialize(options)
      @options = options
    end

    def validate
      validate_districts
      validate_fleet_manager
      validate_fleet_engineer
      validate_vehicles_in_district
    end

    private

    def validate_districts
      condition = @options[:s].count.between?(@options[:min_districts], @options[:max_districts])
      raise_error("must have between #{@options[:min_districts]} and #{@options[:max_districts]} districts") unless condition
    end

    def validate_fleet_manager
      condition = @options[:c].between?(@options[:min_scooters_for_fm], @options[:max_scooters_for_fm])
      raise_error("FM must be between #{@options[:min_scooters_for_fm]} and #{@options[:max_scooters_for_fm]}") unless condition
    end

    def validate_fleet_engineer
      condition = @options[:p].between?(@options[:min_scooters_for_fe], @options[:max_scooters_for_fe])
      raise_error("FE must be between #{@options[:min_scooters_for_fe]} and #{@options[:max_scooters_for_fe]}") unless condition
    end

    def validate_vehicles_in_district
      condition = @options[:s].all? { |v| v.between?(@options[:min_scooters_in_district], @options[:max_scooters_in_district]) }
      raise_error("each district must have between #{@options[:min_scooters_in_district]} and #{@options[:max_scooters_in_district]} scooters") unless condition
    end

    def raise_error(message)
      raise ValidationError, message
    end
  end
end
