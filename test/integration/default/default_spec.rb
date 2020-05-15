describe file '/opt/ragemp-srv' do
  it { should be_directory }
end

describe file '/opt/ragemp-srv/server' do
  it { should be_file }
  it { should be_executable }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file '/opt/ragemp-srv/conf.json' do
  it { should be_file }
  it { should be_mode 0644 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end
