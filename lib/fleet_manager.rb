require 'slop'
require 'slop/array_option'

require 'fleet_manager/version'
require 'fleet_manager/validator'
require 'fleet_manager/calculator'

module FleetManager
  def self.opts
    Slop.parse do |o|
      o.array '-s', 'a list of scooters, example: 12,15,16', delimiter: ',', required: true
      o.integer '-c', 'Fleet Manager maintainability up to C scooters', required: true
      o.integer '-p', 'Fleet Engineer maintainability up to P scooters', required: true

      o.separator ''
      o.separator 'other options:'

      o.integer '--min-districts', 'minimum districts, default: 1', default: 1
      o.integer '--max-districts', 'maximum districts, default: 100', default: 100

      o.integer '--min-scooters-in-district', 'minimum scooters in district, default: 0', default: 0
      o.integer '--max-scooters-in-district', 'maximum scooters in district, default: 1000', default: 1000

      o.integer '--min-scooters-for-fm', 'minimum scooters for FM, default: 1', default: 1
      o.integer '--max-scooters-for-fm', 'maximum scooters for FM, default: 999', default: 999

      o.integer '--min-scooters-for-fe', 'minimum scooters for FE, default: 1', default: 1
      o.integer '--max-scooters-for-fe', 'maximum scooters for FE, default: 1000', default: 1000

      o.on '--version', 'print the gem version' do
        puts FleetManager::VERSION
        exit
      end
      o.on '--help', 'list options' do
        puts o
        exit
      end
    end
  rescue Slop::Error => e
    puts e
    exit
  end

  def self.start
    options = FleetManager.opts.to_hash

    FleetManager::Validator.call(options)

    result = FleetManager::Calculator.call(options[:s], options[:c], options[:p])

    puts "fleet_engineers: #{result}"
  rescue FleetManager::ValidationError => e
    puts e
    exit
  end
end
