#
# Cookbook Name:: locale
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute "locale-gen" do
	action :nothing
end

execute "update-tz" do
	action :nothing
	command "cp -vf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime"
end


cookbook_file "/var/lib/locales/supported.d/ja" do
	action :create
	mode 0644
	owner "root"
	group "root"
	notifies :run, "execute[locale-gen]", :immediately
end

files = %w(/etc/default/locale)

files.each do |f|
  cookbook_file f do
	action :create
	mode 0644
	owner "root"
	group "root"
  end
end

cookbook_file "/etc/timezone" do
	action :create
	mode 0644
	owner "root"
	group "root"
	notifies :run, "execute[update-tz]"
end

execute "apt-get update" do
	action :nothing
end

cookbook_file "/etc/apt/sources.list" do
	action :create
	mode 0644
	owner "root"
	group "root"
	notifies :run, "execute[apt-get update]"
end



