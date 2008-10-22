namespace :radiant do
  namespace :extensions do
    namespace :top_level_page do
      
      desc "Runs the migration of the Top Level Page extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          TopLevelPageExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          TopLevelPageExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Top Level Page to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        Dir[TopLevelPageExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(TopLevelPageExtension.root, '')
          directory = File.dirname(path)
          puts "Copying #{path}..."
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  
    end
  end
end
