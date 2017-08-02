module ApplicationHelper
  def errors_for(field)
    field = field.to_sym
    html = <<-HTML
    <div class="color-red">
      * #{resource.errors.full_messages_for(field).first}
    </div>
    HTML

    html.html_safe
  end

  def book_authors(book)
    book.authors.map(&:name).join(', ')
  end
end
