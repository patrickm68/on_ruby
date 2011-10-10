module ApplicationHelper

  def title
    'Hamburg on Ruby'
  end

  def subtitle
    'Heimathafen der Hamburger Ruby-Community'
  end

  def map(locations, init={})
    locations = Array(locations)
    init = {:zoom => 14, :lat => 53.56544, :long => 9.95947}.merge(init)
    content_tag(:div, '', :class => 'map_canvas', 'data-map' => locations.to_json, 'data-init' => init.to_json)
  end

  def link_to_github(user)
    link_to user.github, "http://github.com/#{user.github}" if user.github
  end

  def link_to_twitter(thing, params={:clung => false}, &block)
    nick = thing.respond_to?(:nickname) ? thing.nickname : thing
    url = "http://twitter.com/#{nick}"
    if block_given?
      link_to url, &block
    else
      link = link_to("@#{nick}", url)
      params[:clung] ? ('(' + link + ')').html_safe : link
    end
  end

  def fancy_box(uid, target=nil)
    content_tag :div, style: "display:none;" do
      content_tag :div, id: uid, style: "width:560px;" do
        yield
        concat content_tag(:p, link_to('mehr...', target)) if target
      end
    end
  end

  def section_box(name)
    content_tag :section, class: name, id: name do
      concat content_tag(:h2, t(name))
      yield
    end
  end

  def twitter_update_url(text)
    "http://twitter.com/home?status=#{URI.encode(text)}"
  end

  def likes
    content_tag :span, class: 'likes' do
      raw <<-HERE
      <g:plusone size="medium"></g:plusone>
      <a href="https://twitter.com/share" class="twitter-share-button" data-count="horizontal" data-via="hamburgsync" data-lang="de">Tweet</a>
      HERE
    end
  end

  def fancy_link_to(text, url, uid)
    link_to text, url, name: uid, class: 'fancy'
  end

  def fancy_block_to(url, uid, &block)
    link_to url, {name: uid, class: 'fancy'}, &block
  end
end
