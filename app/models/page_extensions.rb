module PageExtensions
  def map_descendants_for_select(arr = [], nesting=0)
    arr << ['. '*nesting+self.title, self.id]
    self.children.each do |child|
      child.map_descendants_for_select(arr, nesting + 1)
    end
    arr
  end
end