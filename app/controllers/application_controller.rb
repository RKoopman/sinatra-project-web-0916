class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set(:views, 'app/views')
  set :views, Proc.new { File.join(root, "../views/") }

  not_found do
    erb :error
  end

end
