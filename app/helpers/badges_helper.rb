module BadgesHelper
  def badge_image(badge)
    if badge.file_image.present?
      badge.file_image
    # else
    #   asset_path 'award.jpg'
    end
  end
end
