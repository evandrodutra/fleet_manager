RSpec.describe FleetManager do
  let(:command) { File.join(File.dirname(__FILE__), '..', 'bin', 'fleet_manager') }

  it 'has a version number' do
    output = %x[ #{command} --version ]
    expect(output).to match(/0.1.0/)
  end

  it 'returns fleet_managers running with correct options' do
    output = %x[ #{command} -s 10,15 -c 12 -p 5 ]
    expect(output).to match(/fleet_engineers: 3/)
  end

  it 'returns an error running without -c option' do
    output = %x[ #{command} -s 10,15 -p 5 ]
    expect(output).to match(/missing required option `-c/)
  end

  it 'returns an error running without -p option' do
    output = %x[ #{command} -s 10,15 -c 12 ]
    expect(output).to match(/missing required option `-p/)
  end

  it 'returns an error running without -s option' do
    output = %x[ #{command} -c 12 -p 5 ]
    expect(output).to match(/missing required option `-s/)
  end

  it 'returns the command help' do
    output = %x[ #{command} --help ]
    expect(output).to match(/usage|-s|-c|-p|other options|--help/)
  end
end
