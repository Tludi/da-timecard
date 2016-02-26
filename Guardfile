# A sample Guardfile
# More info at https://github.com/guard/guard#readme

## Uncomment and set this to only include directories you want to watch
# directories %w(app lib config test spec features) \
#  .select{|d| Dir.exists?(d) ? d : UI.warning("Directory #{d} does not exist")}

## Note: if you are using the `directories` clause above and you are not
## watching the project directory ('.'), then you will want to move
## the Guardfile to a watched dir and symlink it back, e.g.
#
#  $ mkdir config
#  $ mv Guardfile config/
#  $ ln -s config/Guardfile .
#
# and, you'll have to watch "config/Guardfile" instead of "Guardfile"

# guard :bundler do
#   require 'guard/bundler'
#   require 'guard/bundler/verify'
#   helper = Guard::Bundler::Verify.new
#
#   files = ['Gemfile']
#   files += Dir['*.gemspec'] if files.any? { |f| helper.uses_gemspec?(f) }
#
#   # Assume files are symlinked from somewhere
#   files.each { |file| watch(helper.real_path(file)) }
# end

# guard :minitest, :spring => true do
#   watch(%r{^app/(.+)\.rb$})                               { |m| "test/#{m[1]}_test.rb" }
#   watch(%r{^app/controllers/application_controller\.rb$}) { "test/controllers" }
#   watch(%r{^app/controllers/(.+)_controller\.rb$})        { |m| "test/integration/#{m[1]}_test.rb" }
#   watch(%r{^app/views/(.+)_mailer/.+})                    { |m| "test/mailers/#{m[1]}_mailer_test.rb" }
#   watch(%r{^app/workers/(.+)\.rb$})                       { |m| "test/unit/workers/#{m[1]}_test.rb" }
#   watch(%r{^lib/(.+)\.rb$})                               { |m| "test/unit/lib/#{m[1]}_test.rb" }
#   watch(%r{^lib/tasks/(.+)\.rake$})                       { |m| "test/unit/lib/tasks/#{m[1]}_test.rb" }
#   watch(%r{^test/.+_test\.rb$})
#   watch(%r{^test/test_helper\.rb$}) { "test" }
# end

# guard :minitest do
#   # with Minitest::Unit
#   watch(%r{^test/(.*)\/?test_(.*)\.rb$})
#   watch(%r{^lib/(.*/)?([^/]+)\.rb$})     { |m| "test/#{m[1]}test_#{m[2]}.rb" }
#   watch(%r{^test/test_helper\.rb$})      { 'test' }

  # with Minitest::Spec
  # watch(%r{^spec/(.*)_spec\.rb$})
  # watch(%r{^lib/(.+)\.rb$})         { |m| "spec/#{m[1]}_spec.rb" }
  # watch(%r{^spec/spec_helper\.rb$}) { 'spec' }

  # Rails 4
  # watch(%r{^app/(.+)\.rb$})                               { |m| "test/#{m[1]}_test.rb" }
  # watch(%r{^app/controllers/application_controller\.rb$}) { 'test/controllers' }
  # watch(%r{^app/controllers/(.+)_controller\.rb$})        { |m| "test/integration/#{m[1]}_test.rb" }
  # watch(%r{^app/views/(.+)_mailer/.+})                   { |m| "test/mailers/#{m[1]}_mailer_test.rb" }
  # watch(%r{^lib/(.+)\.rb$})                               { |m| "test/lib/#{m[1]}_test.rb" }
  # watch(%r{^test/.+_test\.rb$})
  # watch(%r{^test/test_helper\.rb$}) { 'test' }

  # Rails < 4
  # watch(%r{^app/controllers/(.*)\.rb$}) { |m| "test/functional/#{m[1]}_test.rb" }
  # watch(%r{^app/helpers/(.*)\.rb$})     { |m| "test/helpers/#{m[1]}_test.rb" }
  # watch(%r{^app/models/(.*)\.rb$})      { |m| "test/unit/#{m[1]}_test.rb" }
# end

# Guard-Rails supports a lot options with default values:
# daemon: false                        # runs the server as a daemon.
# debugger: false                      # enable ruby-debug gem.
# environment: 'development'           # changes server environment.
# force_run: false                     # kills any process that's holding the listen port before attempting to (re)start Rails.
# pid_file: 'tmp/pids/[RAILS_ENV].pid' # specify your pid_file.
# host: 'localhost'                    # server hostname.
# port: 3000                           # server port number.
# root: '/spec/dummy'                  # Rails' root path.
# server: thin                         # webserver engine.
# start_on_start: true                 # will start the server when starting Guard.
# timeout: 30                          # waits untill restarting the Rails server, in seconds.
# zeus_plan: server                    # custom plan in zeus, only works with `zeus: true`.
# zeus: false                          # enables zeus gem.
# CLI: 'rails server'                  # customizes runner command. Omits all options except `pid_file`!

# guard 'rails' do
#   watch('Gemfile.lock')
#   watch(%r{^(config|lib)/.*})
# end

# Note: The cmd option is now required due to the increasing number of ways
#       rspec may be run, below are examples of the most common uses.
#  * bundler: 'bundle exec rspec'
#  * bundler binstubs: 'bin/rspec'
#  * spring: 'bin/rspec' (This will use spring if running and you have
#                          installed the spring binstubs per the docs)
#  * zeus: 'zeus rspec' (requires the server to be started separately)
#  * 'just' rspec: 'rspec'

# guard :rspec, cmd: "bundle exec rspec" do
#   require "guard/rspec/dsl"
#   dsl = Guard::RSpec::Dsl.new(self)
#
#   # Feel free to open issues for suggestions and improvements
#
#   # RSpec files
#   rspec = dsl.rspec
#   watch(rspec.spec_helper) { rspec.spec_dir }
#   watch(rspec.spec_support) { rspec.spec_dir }
#   watch(rspec.spec_files)
#
#   # Ruby files
#   ruby = dsl.ruby
#   dsl.watch_spec_files_for(ruby.lib_files)
#
#   # Rails files
#   rails = dsl.rails(view_extensions: %w(erb haml slim))
#   dsl.watch_spec_files_for(rails.app_files)
#   dsl.watch_spec_files_for(rails.views)
#
#   watch(rails.controllers) do |m|
#     [
#       rspec.spec.("routing/#{m[1]}_routing"),
#       rspec.spec.("controllers/#{m[1]}_controller"),
#       rspec.spec.("acceptance/#{m[1]}")
#     ]
#   end
#
#   # Rails config changes
#   watch(rails.spec_helper)     { rspec.spec_dir }
#   watch(rails.routes)          { "#{rspec.spec_dir}/routing" }
#   watch(rails.app_controller)  { "#{rspec.spec_dir}/controllers" }
#
#   # Capybara features specs
#   watch(rails.view_dirs)     { |m| rspec.spec.("features/#{m[1]}") }
#   watch(rails.layouts)       { |m| rspec.spec.("features/#{m[1]}") }
#
#   # Turnip features and steps
#   watch(%r{^spec/acceptance/(.+)\.feature$})
#   watch(%r{^spec/acceptance/steps/(.+)_steps\.rb$}) do |m|
#     Dir[File.join("**/#{m[1]}.feature")][0] || "spec/acceptance"
#   end
# end

# Note: The cmd option is now required due to the increasing number of ways
#       rspec may be run, below are examples of the most common uses.
#  * bundler: 'bundle exec rspec'
#  * bundler binstubs: 'bin/rspec'
#  * spring: 'bin/rspec' (This will use spring if running and you have
#                          installed the spring binstubs per the docs)
#  * zeus: 'zeus rspec' (requires the server to be started separately)
#  * 'just' rspec: 'rspec'

# guard :rspec, cmd: "bundle exec rspec" do
#   require "guard/rspec/dsl"
#   dsl = Guard::RSpec::Dsl.new(self)
#
#   # Feel free to open issues for suggestions and improvements
#
#   # RSpec files
#   rspec = dsl.rspec
#   watch(rspec.spec_helper) { rspec.spec_dir }
#   watch(rspec.spec_support) { rspec.spec_dir }
#   watch(rspec.spec_files)
#
#   # Ruby files
#   ruby = dsl.ruby
#   dsl.watch_spec_files_for(ruby.lib_files)
#
#   # Rails files
#   rails = dsl.rails(view_extensions: %w(erb haml slim))
#   dsl.watch_spec_files_for(rails.app_files)
#   dsl.watch_spec_files_for(rails.views)
#
#   # Rails
#   watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
#   watch(%r{^app/(.*)(\.erb|\.haml)$})                 { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
#   watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"] }
#   watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
#   watch('config/routes.rb')                           { "spec/routing" }
#   watch('app/controllers/application_controller.rb')  { "spec/controllers" }
#
#   watch(rails.controllers) do |m|
#     [
#       rspec.spec.("routing/#{m[1]}_routing"),
#       rspec.spec.("controllers/#{m[1]}_controller"),
#       rspec.spec.("acceptance/#{m[1]}")
#     ]
#   end
#
#   # Rails config changes
#   watch(rails.spec_helper)     { rspec.spec_dir }
#   watch(rails.routes)          { "#{rspec.spec_dir}/routing" }
#   watch(rails.app_controller)  { "#{rspec.spec_dir}/controllers" }
#
#   # Capybara features specs
#   watch(rails.view_dirs)     { |m| rspec.spec.("features/#{m[1]}") }
#   watch(rails.layouts)       { |m| rspec.spec.("features/#{m[1]}") }
#
#   # Turnip features and steps
#   watch(%r{^spec/acceptance/(.+)\.feature$})
#   watch(%r{^spec/acceptance/steps/(.+)_steps\.rb$}) do |m|
#     Dir[File.join("**/#{m[1]}.feature")][0] || "spec/acceptance"
#   end
# end


# guard :rspec, cmd: 'spring rspec --color --format documentation',
guard :rspec, cmd: "bundle exec rspec" do
  # all_on_start: false, all_after_pass: false do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }

  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^app/(.*)(\.erb|\.haml)$})                 { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb" }
  watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
  watch('app/controllers/application_controller.rb')  { "spec/controllers" }

  watch(%r{^app/views/(.+)/.*\.(erb|haml)$})          { |m| "spec/features/#{m[1]}_spec.rb" }

  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/rails_helper.rb')  { "spec" }
end
