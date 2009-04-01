module RExtensions
  module ActionView
    module Helpers
      module TranslationHelper
        
        # Override the built in Rails translation method to handle Textile
        # formatting in translation files (i.e. WYSIWYMean-ish translations)
        def translate(key, options = {})
          translate(key, options).to_s.textilize(:trim => true)
        end
        
      end
    end
  end
end