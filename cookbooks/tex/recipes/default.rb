#
# Cookbook Name:: tex
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

dist = node['lsb']['codename']
ppa = "ppa:texlive-backports/ppa"

package "python-software-properties" do
  action :install
end

execute "apt-get update" do
  action :nothing
end

execute "add ppa:texlive" do
  command "add-apt-repository #{ppa}"
  creates "/etc/apt/sources.list.d/texlive-backports-ppa-#{dist}.list"
  notifies :run, "execute[apt-get update]"
end

%w(texlive-lang-cjk texlive-fonts-recommended).each do |pkg|
  package pkg do
    action :install
  end
end
