module MessagesHelper

  def show_tag(message)
    tag_s = ""
    unless message.tags.blank? 
      if message.tags.length > 0 
        tag_s = "tags: "
      else
        tag_s = "tag: "
      end
      tag_s = tag_s + message.tags.join(", ")
    end
    return tag_s
  end
end
