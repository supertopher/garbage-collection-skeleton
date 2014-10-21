require 'bundler/setup'
Bundler.require(:default)

$LOAD_PATH.unshift(File.expand_path('.'))


# Load All the ruby files in routes and models
Dir["routes/*.rb"].each do |file_to_load|
    require file_to_load
end