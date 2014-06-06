#
# Cookbook Name:: jenkins
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute "apt-get update" do
	action :nothing
end

apt_repository "jenkins" do
	uri "http://pkg.jenkins-ci.org/debian"
	components ['binary/']
	key "http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key"
	notifies :run, "execute[apt-get update]", :immediately
end

package "jenkins" do
	action :install
end
