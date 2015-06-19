module Blogit
  module Generators
    class InstallGenerator < Rails::Generators::Base
      
      source_root File.expand_path('../../templates', __FILE__)

      desc "Creates a Blogit initializer in your application's config/initializers dir"

      def copy_initializer
        template "blogit.rb", "config/initializers/blogit.rb"
        template "create_blogit_posts.rb", "db/migrate/#{Time.now.to_s(:number)}_create_blogit_posts.rb"
        template "create_blogit_comments.rb", "db/migrate/#{(Time.now + 1.second).to_s(:number)}_create_blogit_comments.rb"
        template "acts_as_taggable_on_migration.rb", "db/migrate/#{(Time.now + 2.second).to_s(:number)}_acts_as_taggable_on_migration.rb"
        template "add_missing_unique_indices.rb", "db/migrate/#{(Time.now + 3.second).to_s(:number)}_add_missing_unique_indices.rb"
        template "add_taggings_counter_cache_to_tags.rb", "db/migrate/#{(Time.now + 4.second).to_s(:number)}_add_taggings_counter_cache_to_tags.rb"
      end

    end
  end
end
