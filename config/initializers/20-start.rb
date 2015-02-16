puts "Running 20-start.rb"

require 'active_list'
#autoload :ActiveList , 'active_list'
#::ActionController::Base.send(:include, ActiveList::ActionPack::ActionController)
#::ActionView::Base.send(:include, ActiveList::ActionPack::ViewsHelper)
::ActionController::Base.send(:include, ActiveList::Rails::Integration::ActionController)
::ActionView::Base.send(:include, ActiveList::Rails::Integration::ViewsHelper)
