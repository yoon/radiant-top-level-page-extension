module TopLevelPage::PageExtensions
  def self.included(base)
    base.extend ClassMethods
  end
  def map_descendants_for_select(arr = [], nesting=0, depth=1.0/0)
    arr << ['. '*nesting+self.title, self.id]
    if nesting < depth
      self.children.each do |child|
        child.map_descendants_for_select(arr, nesting + 1, depth)
      end
    end
    arr
  end
  module ClassMethods
    def map_for_select(depth=1.0/0)
      if Object.const_defined?("MultiSiteExtension") #using multisites
        arr = []
        Site.find(:all).map(&:homepage).each do |page|
          arr += page.map_descendants_for_select([],0,depth)
        end
        arr
      else
        Page.find_by_parent_id(nil).map_descendants_for_select([],0,depth)
      end
    end
  end
end