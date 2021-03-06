module CleanParams
  module Generators
    class InstallGenerator < Rails::Generators::Base
      def self.source_root
        File.dirname(__FILE__) + "/templates"
      end

      def copy_files
        template "clean_params.rb", "config/initializers/clean_params.rb"
      end
    end
  end
end