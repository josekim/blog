module ApplicationHelper


  def self.generate_tags_and_taggings(post, tags)
    tags.split(", ").each do |tag|
      new_tag = Tag.find_or_create_by(name: tag.strip)
      post.tags << new_tag
      # new_tagging = Tagging.create(post_id: post_id , tag_id: new_tag.id )
    end
    nil
  end

  def self.update_tags_and_taggings(post, tags)
    self.delete_tags(post)
    tags.split(", ").each do |tag|
      new_tag = Tag.find_or_create_by(name: tag.strip)
      post.tags << new_tag
      # new_tagging = Tagging.create(post_id: post_id , tag_id: new_tag.id )
    end
    nil
  end

  def self.delete_tags(post)
    post.taggings.each do |tagging|
      tagging.delete
    end
  end

end
