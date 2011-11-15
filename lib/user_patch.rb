module UserPatch
  def self.included(base)
    #base.extend(ClassMethods)
    #base.send(:include, InstanceMethods)
    base.class_eval do 
      unloadable
      safe_attributes 'manager_id', 'is_manager'
      belongs_to :manager, :class_name => 'User'
      has_many :reports, :class_name => 'User', :foreign_key => 'manager_id'
      named_scope :is_manager, {:conditions => {:is_manager => true}}
    end
  end
  #module ClassMethods; end
  #module InstanceMethods; end
end
