# Requires all the tasks defined
Dir[File.expand_path('../tasks/*', __FILE__)].each do |f|
  require f
end
