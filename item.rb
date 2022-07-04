class Item
   def move_to_archive
    if can_be_archived?
        retrun true  
    end
   end

   private
  
   def can_be_archived?
    if @publish_date > 10
        return true
    else
        return false
    end
   end
end