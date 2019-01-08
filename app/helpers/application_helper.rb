module ApplicationHelper

  # Returns full title for each page
  def full_title page_title = ''
    base_title = 'CookBook by Cezik'
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
