require 'redmine'

ActionDispatch::Callbacks.to_prepare do
  require_dependency 'redmine/helpers/gantt'
  Redmine::Helpers::Gantt.send(:include, GanttPatch)
end

Redmine::Plugin.register :redmine_gantt_order do
  name        'Redmine gantt ordering'
  author      'David Robinson'
  description 'Orders the gantt diagram by assignee'
  version     '0.1.0'
end

