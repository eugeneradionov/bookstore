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

  def number_to_euro(amount)
    '€%.2f' % amount
  end

  def book_first_sentence(book)
    book.description[/^(.*?)[.?!]/]
  end

  def order_date(order)
    order.created_at.strftime('%B %d, %Y')
  end

  def phone_pattern
    '^\+\D?\d{3}\D?\d{2}\D?\d{3}(\D?\d{2}){2}$'
  end

  def error_message_for(object, field)
    object.errors.full_messages_for(field).first
  end
end
