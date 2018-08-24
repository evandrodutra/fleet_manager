RSpec.describe FleetManager::Validator do
  let(:validator) { FleetManager::Validator }
  let(:options) do
    {
      s: [10, 15],
      p: 12,
      c: 5,
      min_districts: 1,
      max_districts: 100,
      min_scooters_for_fm: 1,
      max_scooters_for_fm: 999,
      min_scooters_for_fe: 1,
      max_scooters_for_fe: 1000,
      min_scooters_in_district: 0,
      max_scooters_in_district: 1000
    }
  end

  it 'does not returns an error with correct options' do
    expect(validator.call(options)).to be_nil
  end

  it 'raises an error when using wrong districts' do
    options[:s] = []

    expect { validator.call(options) }.to raise_error(FleetManager::ValidationError, 'must have between 1 and 100 districts')
  end

  it 'raises an error when using wrong fleet manager' do
    options[:c] = 2000

    expect { validator.call(options) }.to raise_error(FleetManager::ValidationError, 'FM must be between 1 and 999')
  end

  it 'raises an error when using wrong fleet engineer' do
    options[:p] = 3000

    expect { validator.call(options) }.to raise_error(FleetManager::ValidationError, 'FE must be between 1 and 1000')
  end

  it 'raises an error when using wrong vehicles in district' do
    options[:s] = [2000]

    expect { validator.call(options) }.to raise_error(FleetManager::ValidationError, 'each district must have between 0 and 1000 scooters')
  end
end
