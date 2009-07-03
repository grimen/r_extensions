Dir[File.expand_path(File.join(File.dirname(__FILE__), 'lib', '**', '*.rb'))].uniq.each do |file|
  require file
end

ActionController::Base.class_eval do
  include RExtensions::ActionController::Base
  include RExtensions::ActionController::Resource
  include RExtensions::ActionController::Security
end

# ActionController::Filters::AroundFilter.class_eval do
#   include RExtensions::ActionController::Filters::AroundFilter
# end

ActionView::Base.class_eval do
  include RExtensions::ActionView::Helpers::BaseHelper
  include RExtensions::ActionView::Helpers::FormHelper
  include RExtensions::ActionView::Helpers::NavigationHelper
  include RExtensions::ActionView::Helpers::ResourceHelper
  include RExtensions::ActionView::Helpers::TagHelper
  include RExtensions::ActionView::Helpers::TextHelper
  include RExtensions::ActionView::Helpers::TranslationHelper
  include RExtensions::ActionView::Helpers::UrlHelper
end

ActiveRecord::Base.class_eval do
  include RExtensions::ActiveRecord::Base
  include RExtensions::ActiveRecord::Validations
end
