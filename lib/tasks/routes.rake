# fixes issue with annotate gem attempting to run rake routes instead of rails routes.
task routes: :environment do
  puts `bundle exec rails routes`
end
