module ApplicationHelper
  def instance_image_tag(picture, options = {})
    if picture.attached?
      cl_image_tag picture.key, options
    else
      image_tag "no-picture.png", options
    end
  end

  def instance_image_path(picture, options = {})
    if picture.attached?
      cl_image_path picture.key, options
    else
      image_path "no-picture.png", options
    end
  end
end
