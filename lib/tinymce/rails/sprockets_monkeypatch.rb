require 'sprockets/asset'

module Sprockets
  class Asset

    def digest_path_with_tinymce
      return logical_path if logical_path =~ /^tinymce\//
      digest_path_without_tinymce
    end

    alias_method_chain :digest_path, :tinymce
  end
end
