require 'slop'
require 'fleet_manager/version'

module FleetManager
  def self.opts
    Slop.parse do |o|
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
  end
end
