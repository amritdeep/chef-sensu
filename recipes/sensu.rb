## Install dependent package
package 'epel-release'
package 'redis'
package 'erlang'

package 'rabbitmq-server' do
  options '--enablerepo=epel'
  action :install
end

template '/etc/yum.repos.d/sensu.repo' do
  source 'sensu.repo.erb'
  owner 'root'
  mode '0755'
end

package 'sensu' do
  options '--enablerepo=sensu'
  action :install
end

package 'uchiwa' do
  action :install
end
