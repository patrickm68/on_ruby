module TitleHelper
  def page_title
    "#{title} - #{title_mapping ? title_mapping.call : subtitle}"
  end

  def mobile_title
    title_mapping ? title_mapping.call : title
  end

  def meta_desc
    "#{page_title} - #{I18n.tw("meta_desc")}"
  end

  def title
    I18n.tw("title")
  end

  def subtitle
    I18n.tw("subtitle")
  end

  private

  def title_mapping(controller_name = self.controller_name, action_name = self.action_name)
    {
      'users/show'      => -> { user.name },
      'wishes/show'     => -> { wish.name },
      'locations/show'  => -> { current_location.name },
      'events/show'     => -> { event.name },
      'mobile/settings' => -> { t('mobile.settings') }
   }["#{controller_name}/#{action_name}"]
  end
end
