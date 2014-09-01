current_dir = File.dirname(__FILE__)

# Set the node name to your Opscode account name
node_name              "timurb"

# Optionally change these
client_key      ENV['CHEF_KEY'] || "#{current_dir}/client.pem"             # Path to workstation key
validation_key  ENV['CHEF_VALIDATION'] || "#{current_dir}/validation.pem"  # Path to validation key
chef_server_url ENV['CHEF_SERVER'] || "https://chef.test.cinarra.com/"     # Chef server API endpoint for our organization

# You generally don't need to edit the below params
log_level     :info
log_location  STDOUT
cache_type    'BasicFile'
cache_options ({ :path => "#{ENV['HOME']}/.chef/checksums" })
cookbook_path ["#{ENV['HOME']}/src/cnr-chef/cookbooks"]

if node_name == "CHANGEME"
  raise "Edit your knife.rb and set 'node_name' to your username"
end
