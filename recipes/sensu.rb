## Install dependent package
package 'epel-release'
package 'redis'
package 'erlang'

package 'rabbitmq-server' do
  options '--enablerepo=epel'
  action :install
end
