require 'rails/generators'

module CleanParams
  class InstallGenerator < Rails::Generators::Base
    def self.source_root
      File.dirname(__FILE__) + "/templates"
    end

    def copy_files
      template "clean_params.rb", "config/clean_params.rb"
    end
  end
end