Dir[File.expand_path(File.join(File.dirname(__FILE__), 'lib', '**', '*.rb'))].uniq.each do |file|
  require file
end

ActionController::Base.send :include, RExtensions::ActionController::Core
ActionController::Base.send :include, RExtensions::ActionController::Resource
ActionController::Base.send :include, RExtensions::ActionController::Security

ActionView::Base.send :include, RExtensions::ActionView::CoreHelper
ActionView::Base.send :include, RExtensions::ActionView::FormHelper
ActionView::Base.send :include, RExtensions::ActionView::NavigationHelper
ActionView::Base.send :include, RExtensions::ActionView::ResourceHelper
ActionView::Base.send :include, RExtensions::ActionView::TagHelper

#ActiveRecord::Base.send :include, RExtensions::ActionRecord::Validations