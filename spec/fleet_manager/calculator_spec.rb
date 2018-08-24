RSpec.describe FleetManager::Calculator do
  let(:calculator) { FleetManager::Calculator }
  let(:options) do
    {
      s: [10, 15],
      p: 12,
      c: 5,
    }
  end

  it 'returns the number of fleet enginners' do
    expect(calculator.call(options[:s], options[:p], options[:c])).to eq(3)
  end
end
