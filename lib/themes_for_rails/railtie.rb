# ActiveSupport.on_load(:action_view) { include Devise::Controllers::UrlHelpers }

module ThemesForRails
  class Railtie < ::Rails::Railtie
    config.themes_for_rails = ActiveSupport::OrderedOptions.new

    config.to_prepare do
      ThemesForRails::Railtie.config.themes_for_rails.each do |key, value|
        ThemesForRails.config.send "#{key}=".to_sym, value
      end
      
      # Adding theme stylesheets path to sass, automatically. 
      ThemesForRails.add_themes_path_to_sass if ThemesForRails.config.use_sass?
      
    end
    
    rake_tasks do
      load "tasks/themes_for_rails.rake"
    end
  end
end