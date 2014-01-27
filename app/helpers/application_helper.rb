module ApplicationHelper

  def add_menu
    presenter = Refinery::Pages::MenuPresenter.new(refinery_menu_pages, self)
    presenter.dom_id = "main_menu"
    presenter.selected_css = "active"
    presenter
  end
  def title(page_title)
    content_for (:title) {page_title}
  end
end
