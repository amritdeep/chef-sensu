#
# Cookbook:: sensu
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

# describe 'sensu::default' do
describe 'sensu::sensu' do
  package_list = ['epel-release', 'redis', 'erlang', 'rabbitmq-server', 'sensu', 'uchiwa']

  context 'When all attributes are default, on an Ubuntu 16.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    package_list.each do |pkg|
      it 'should install package' do
        expect(chef_run).to install_package(pkg)
      end
    end

    it 'create sensu repo' do
      expect(chef_run).to render_file('/etc/yum.repos.d/sensu.repo').with_content('sensu')
      expect(chef_run).to create_template('/etc/yum.repos.d/sensu.repo')
    end
  end
end
