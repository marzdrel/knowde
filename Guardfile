# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard :shell do
  watch(%r{app/javascript/.*}) do
    %x[yarn build]
    n(
      %(Recompiling JS: Running "yarn build"),
      "File Changed",
    )
  end

  watch(%r{app/assets/stylesheets/.*}) do
    n %(Recompiling JS: Running "yarn build:css")
    %x[yarn build:css]
  end
end

guard :livereload do
  watch(%r{app/views/.+\.(erb|haml|slim)$})
  watch(%r{app/.+\.rb})
  watch(%r{config/locales/.+\.yml})
end

GUARD_RSPEC_OPTIONS = {
  failed_mode: :keep,
  cmd: "spring rspec --order rand:$RANDOM",
  title: "RSpec",
}.freeze

guard :rspec, GUARD_RSPEC_OPTIONS do
  directories %w[app spec lib config]

  watch(%r{^spec/.+_spec\.rb$})

  watch(%r{^lib/(.+)\.rb$}) do |m|
    "spec/lib/#{m[1]}_spec.rb"
  end

  watch("spec/spec_helper.rb") do
    "spec"
  end

  # Rails example
  watch(%r{^app/(.+)\.rb$}) do |m|
    "spec/#{m[1]}_spec.rb"
  end

  watch(%r{^app/(.*)(\.erb|\.haml|\.slim)$}) do |m|
    "spec/#{m[1]}#{m[2]}_spec.rb"
  end

  watch(%r{^app/controllers/(.+)_(controller)\.rb$}) do |m|
    [
      "spec/routing/#{m[1]}_routing_spec.rb",
      "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb",
      "spec/acceptance/#{m[1]}_spec.rb",
    ]
  end

  watch(%r{^spec/support/(.+)\.rb$}) do
    "spec"
  end

  watch("config/routes.rb") do
    "spec/routing"
  end

  watch("app/controllers/application_controller.rb") do
    "spec/controllers"
  end

  # Capybara features specs
  watch(%r{^app/views/(.+)/.*\.(erb|haml|slim)$}) do |m|
    "spec/features/#{m[1]}_spec.rb"
  end

  # Turnip features and steps
  watch(%r{^spec/acceptance/(.+)\.feature$})

  watch(%r{^spec/acceptance/steps/(.+)_steps\.rb$}) do |m|
    Dir[File.join("**/#{m[1]}.feature")][0] || "spec/acceptance"
  end
end
