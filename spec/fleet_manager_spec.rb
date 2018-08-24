RSpec.describe FleetManager do
  let(:command) { File.join(File.dirname(__FILE__), '..', 'bin', 'fleet_manager') }

  it 'has a version number' do
    output = %x[ #{command} --version ]
    expect(output).to match(/0.1.0/)
  end

  it 'returns the command help' do
    output = %x[ #{command} --help ]
    expect(output).to match(/usage|-s|-c|-p|other options|--help/)
  end
end
