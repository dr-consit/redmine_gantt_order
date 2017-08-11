module GanttPatch
  def self.included(base)
    base.extend ClassMethods
    base.class_eval do
      unloadable
      class << self
        alias_method_chain :sort_issue_logic, :assignee
      end
    end
  end

  module ClassMethods    
    def sort_issue_logic_with_assignee(issue)
      julian_date = Date.new()
      ancesters_start_date = []
      current_issue = issue
      begin
        ancesters_start_date.unshift(
		[
			current_issue.assigned_to || current_issue.start_date || julian_date, 
			current_issue.start_date || julian_date,
			current_issue.id			
		]
	)
        current_issue = current_issue.parent
      end while (current_issue)
      ancesters_start_date
    end
  end
end
