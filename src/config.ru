require File.expand_path("../config/boot.rb", __FILE__)
?{redirect_to_www}{
# Redirect naked domain to 'www'
DOMAIN = '!{domain_name}'

# Redirect to the www version of the domain in production
use Rack::Rewrite do
  r301 %r{.*}, "http://#{DOMAIN}$&", :if => Proc.new {|rack_env|
    rack_env['SERVER_NAME'] != DOMAIN && ENV['RACK_ENV'] == "production"
  }
end
}{}
# Assets
less = Sprockets::Environment.new
less.append_path("app/assets/less")

js = Sprockets::Environment.new
js.append_path("app/assets/coffee")
js.append_path("app/assets/js")

# Routes
map("/css") { run less }
map("/js") { run js }
map("/") { run !{project_name_camel}App }
