module TinyMCE
  module Rails
    class Engine < ::Rails::Engine
      initializer "configure assets", :group => :all do |app|
        app.config.assets.precompile << 'tinymce/*'
      end
    end
  end
end
