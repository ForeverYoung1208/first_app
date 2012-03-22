module ApplicationHelper
  def li_current_page_item (selected_page, current_page, &block)
      content = with_output_buffer(&block)
      if selected_page==current_page
#        content_tag(:span) do
          content_tag(:li, content, :class => 'current_page_item ui-widget-content', :id=>current_page)
#        end
      else 
        content_tag(:li, content, :class => 'not_current_page_item ui-widget-content', :id=>current_page)
      end
  end

end
