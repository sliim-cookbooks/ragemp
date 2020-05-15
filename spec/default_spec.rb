require_relative 'spec_helper'

describe 'ragemp::default' do
  let(:runner) do
    ChefSpec::SoloRunner.new(file_cache_path: '/var/chef/cache') do |node|
      node.override['ragemp']['prefix'] = '/server'
      node.override['ragemp']['version'] = '1337'
      node.override['ragemp']['config']['maxplayers'] = 10
      node.override['ragemp']['config']['name'] = 'RAGE:MP spec'
      node.override['ragemp']['config']['gamemode'] = 'specmod'
      node.override['ragemp']['config']['stream-distance'] = 200.0
      node.override['ragemp']['config']['announce'] = true
      node.override['ragemp']['config']['port'] = 33006
    end
  end

  let(:subject) do
    runner.converge(described_recipe)
  end

  before do
    stub_command('test -f /var/chef/cache/ragemp-srv.tar.gz').and_return(false)
  end

  it 'installs package[gcc]' do
    expect(subject).to install_package('gcc')
  end

  it 'creates remote_file[/var/chef/cache/ragemp-srv.tar.gz]' do
    expect(subject).to create_remote_file('/var/chef/cache/ragemp-srv.tar.gz')
      .with(source: 'https://cdn.rage.mp/lin/ragemp-srv-1337.tar.gz',
            owner: 'root',
            group: 'root',
            mode: '0644')
    expect(subject.remote_file('/var/chef/cache/ragemp-srv.tar.gz')).to notify('execute[untar-gz]').to(:run)
  end

  it 'creates file[/server/ragemp-srv/server]' do
    expect(subject).to create_file('/server/ragemp-srv/server').with(mode: '0755')
  end

  it 'creates file[/server/ragemp-srv/conf.json]' do
    expect(subject).to create_file('/server/ragemp-srv/conf.json')
      .with(mode: '0644',
            content: runner.node['ragemp']['config'].to_json)
  end
end
