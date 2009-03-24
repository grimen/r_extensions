Dir[File.expand_path(File.join(File.dirname(__FILE__), 'lib', '**', '*.rb'))].uniq.each do |file|
  require file
end

ActionController::Base.send :include, RExtensions::ActionController::Core
ActionController::Base.send :include, RExtensions::ActionController::Resource
ActionController::Base.send :include, RExtensions::ActionController::Security

ActionView::Base.send :include, RExtensions::ActionView::Helpers::CoreHelper
ActionView::Base.send :include, RExtensions::ActionView::Helpers::FormHelper
ActionView::Base.send :include, RExtensions::ActionView::Helpers::NavigationHelper
ActionView::Base.send :include, RExtensions::ActionView::Helpers::ResourceHelper
ActionView::Base.send :include, RExtensions::ActionView::Helpers::TagHelper
ActionView::Base.send :include, RExtensions::ActionView::Helpers::UrlHelper

#ActiveRecord::Base.send :include, RExtensions::ActionRecord::Validations