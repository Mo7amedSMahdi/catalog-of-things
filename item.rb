class Item
  def move_to_archive
    retrun true if can_be_archived?
  end

  private

  def can_be_archived?
    @publish_date > 10
  end
end
