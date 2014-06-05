#
# Cookbook Name:: sphinx
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

pythons = %w(wget python-software-properties python3 python3-dev)

pythons.each do |pkg|
  package pkg do
    action :install
  end
end

execute "install easy_install" do
  command "wget -O- https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py | python3"
  action :run
  creates "/usr/local/bin/easy_install"
end

execute "install sphinx" do
  command "easy_install sphinx"
  action :run
  creates "/usr/local/bin/sphinx-quickstart"
end
