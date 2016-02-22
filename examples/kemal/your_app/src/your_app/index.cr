get "/" do
	app_id = ENV["app_id"] 	
	render "views/index.ecr"
end


