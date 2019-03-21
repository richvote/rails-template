gem 'slim-rails'
gem 'html2slim'
gem 'bootstrap'
gem 'jquery-rails'
run 'bundle'
run 'bundle exec erb2slim app/views/layouts/ -d'
run 'rm app/assets/stylesheets/application.css'
file 'app/assets/stylesheets/application.scss', <<-CODE
@import "bootstrap";
CODE
inject_into_file 'app/assets/javascripts/application.js', :before => '//= require_tree .' do
<<-CODE
//= require jquery3
//= require popper
//= require bootstrap-sprockets
CODE
end
inject_into_file 'Gemfile',:after => "'sqlite3'" do
  ",'~>1.3.6'"
end