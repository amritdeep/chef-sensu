package_list = ['epel-release', 'redis', 'erlang']

package_list.each do |pgk|
  describe package(pgk) do
    it { should be_installed }
  end
end
