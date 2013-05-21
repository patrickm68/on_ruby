module HomeHelper
  def next_event_date
    Event.next_event_date
  end

  def mobile_navigation
    content_for :mobile_navigation do
      content_tag :div, data: {role: "navbar", iconpos: "right"} do
        content_tag :ul do
          [:events, :topics, :people, :locations].each do |it|
            concat(content_tag :li, link_to(t(it), root_path(anchor: it), class: it == :events ? "ui-btn-active" : ""))
          end
        end
      end
    end
  end
end
