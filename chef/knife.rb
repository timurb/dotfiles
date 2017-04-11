# See http://docs.chef.io/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)

#
# Define chef params these using ENV vars
# Use of http://direnv.net is recommended to dynamically set these
#
%w(CHEF_NODE_NAME CHEF_CLIENT_KEY CHEF_SERVER_URL CHEF_COOKBOOKS_PATH).each do |var|
  raise "ENV['#{var}'] is not defined" unless ENV[var]
end

node_name                ENV['CHEF_NODE_NAME']
client_key               ENV['CHEF_CLIENT_KEY']
chef_server_url          ENV['CHEF_SERVER_URL']
cookbook_path            ENV['CHEF_COOKBOOKS_PATH']

log_level                :info
log_location             STDOUT
