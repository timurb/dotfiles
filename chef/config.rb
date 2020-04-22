# See http://docs.chef.io/config_rb_knife.html for more information on knife configuration options

#
# Define chef params using ENV vars
# Use of http://direnv.net is recommended to dynamically set these
#
%w(CHEF_NODE_NAME CHEF_CLIENT_KEY CHEF_SERVER_URL).each do |var|
  raise "ENV['#{var}'] is not defined" unless ENV[var]
end

node_name                ENV['CHEF_NODE_NAME']
client_key               ENV['CHEF_CLIENT_KEY']
chef_server_url          ENV['CHEF_SERVER_URL']


### Set cookbook_path ###

paths = [ ENV['CHEF_COOKBOOKS_PATH'] ]

(1..9).each do |n|
  paths << ENV["CHEF_COOKBOOKS_PATH#{n}"]
end

paths = paths.compact

raise "No CHEF_COOKBOOK_PATH vars defined" if paths.empty?

cookbook_path            paths


### Define author info ###

cookbook_copyright ENV['CHEF_COOKBOOK_AUTHOR']
cookbook_email ENV['CHEF_COOKBOOK_EMAIL']
cookbook_license ENV['CHEF_COOKBOOK_LICENSE']

if chefdk && chefdk.generator
  chefdk.generator.email = ENV['CHEF_COOKBOOK_EMAIL']
  chefdk.generator.copyright_holder = ENV['CHEF_COOKBOOK_AUTHOR']
  chefdk.generator.license = ENV['CHEF_COOKBOOK_LICENSE']
end

if chefdk && ENV['CHEF_COOKBOOK_GENERATOR']
  chefdk.generator_cookbook = ENV['CHEF_COOKBOOK_GENERATOR']
end

log_level                :info
log_location             STDOUT

knife[:ssh_user] = ENV['KNIFE_SSH_USER'] || 'tbatyrshin'
