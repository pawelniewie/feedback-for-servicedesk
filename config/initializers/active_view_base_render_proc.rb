ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  if html_tag =~ /label/
    html_tag.html_safe
  else
    (html_tag + instance.error_message.map(&:capitalize).map { |em| "<div class=\"error\">#{em}</div>" }.join('').html_safe)
  end
end