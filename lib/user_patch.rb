module UserPatch
  def self.included(base)
    #base.extend(ClassMethods)
    #base.send(:include, InstanceMethods)
    base.class_eval do 
      unloadable
      safe_attributes 'manager_id', 'is_manager', 'team_name'
      belongs_to :manager, :class_name => 'User'
      has_many :reports, :class_name => 'User', :foreign_key => 'manager_id', :uniq => true
      named_scope :is_manager, {:conditions => {:is_manager => true}}
      def team
        if is_manager
          ids = (reports+[self]).flatten.map(&:id).uniq
        elsif manager
          ids = (manager.reports+[manager]).flatten.map(&:id).uniq
        else
          return []
        end
        self.class.find(:all, :conditions => {:id => ids})
      end
      def teamname
        mgr = is_manager ? self : manager
        manager.team_name || manager.name rescue nil
      end
    end
  end
  #module ClassMethods; end
  #module InstanceMethods; end
end
