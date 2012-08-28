class !{project_name_camel}App < Sinatra::Base
  helpers Sinatra::Cookies
  helpers Sinatra::ContentFor
  helpers Sinatra::JSON

  use Rack::Session::Cookie,
    :key => "sid",
    :expire_after => 2592000,
    :secret => 'test secret'

  set :public_folder, !{project_name_camel}.root('app', 'assets')
  set :views, !{project_name_camel}.root('app', 'templates')

  configure :development do
    register Sinatra::Reloader

    Mail.defaults do
      delivery_method :smtp, :port => 2525
    end
  end

  configure :production do
    Mail.defaults do
      delivery_method :smtp,
        :address => 'smtp.sendgrid.net',
        :port => '587',
        :domain => 'heroku.com',
        :user_name => ENV['SENDGRID_USERNAME'],
        :password => ENV['SENDGRID_PASSWORD'],
        :authentication => :plain,
        :enable_starttls_auto => true
    end
  end

  configure :test do
    Mail.defaults do
      delivery_method :test
    end
  end
end
