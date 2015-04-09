# Cookbook Name:: stig
# Recipe:: login_banner
# Author: Ivan Suftin <isuftin@usgs.gov>
#
# Description: Create login banners
#
# CIS Benchmark Items
# RHEL6:  8.1, 8.1.1
# CENTOS6: 8.1, 8.2
# UBUNTU: 11.1, 11.2
#
# - Set Warning Banner for Standard Login Services
# - Remove OS Information from Login Warning Banners

template "motd" do
  source "motd.erb"
  path "/etc/motd"
  owner "root"
  group "root"
  mode 0644
  variables(
    :banner_text => node['stig']['login_banner']['motd']
  )
end

template "issue" do
  source "issue.erb"
  path "/etc/issue"
  owner "root"
  group "root"
  mode 0644
  variables(
    :banner_text => node['stig']['login_banner']['issue']
  )
end

template "issue.net" do
  source "issue.net.erb"
  path "/etc/issue.net"
  owner "root"
  group "root"
  mode 0644
  variables(
    :banner_text => node['stig']['login_banner']['issue_net']
  )
end
