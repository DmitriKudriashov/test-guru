module BadgesHelper

  def badge_image(badge)
    path_badge_file = "#{Rails.root}/app/assets/images/"
    if badge.file_image.present? && File.file?("#{path_badge_file}#{badge.file_image}")
      image = badge.file_image
    else
      image = File.file?("#{path_badge_file}/award.png") ? 'award.png' : 'Without Badge Image!'
    end
    image_tag(image, size: "170x110")
  end
end
