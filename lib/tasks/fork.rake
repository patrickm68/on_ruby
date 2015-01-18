namespace :fork do
  desc "create a new usergroup"
  task(:usergroup, [:name] => [:environment]) do |t, args|
    name = args[:name]
    usergroup = Usergroup.from_name(name)

    usergroups = Whitelabel.labels + [usergroup]
    File.open(Rails.root.join("config/whitelabel.yml"), 'w') { |file| file.write usergroups.to_yaml }

    I18n.available_locales.each do |locale|
      file_name   = Rails.root.join("config/locales/#{locale}.label.yml")
      translation = File.open(file_name) { |file| YAML.load(file) }
      translation["#{locale}"]["label"][usergroup.label_id] = {
        city: "City",
        name: "Name",
        title: "Title",
        subtitle: "SubTitle",
        meta_desc: "MetaDesc",
      }
      File.open(file_name, 'w') { |file| file.write(translation.to_yaml) }
    end

    FileUtils.touch(Rails.root.join("app/assets/images/labels/#{usergroup.label_id}.ico"))
    FileUtils.touch(Rails.root.join("app/assets/images/labels/#{usergroup.label_id}.png"))
    FileUtils.mkdir_p(Rails.root.join("app/assets/images/labels/#{usergroup.label_id}"))
    FileUtils.touch(Rails.root.join("app/assets/images/labels/#{usergroup.label_id}/.gitkeep"))
    FileUtils.touch(Rails.root.join("app/assets/stylesheets/labels/#{usergroup.label_id}.sass"))
    FileUtils.mkdir_p(Rails.root.join("app/assets/stylesheets/labels/#{usergroup.label_id}"))
    FileUtils.touch(Rails.root.join("app/assets/stylesheets/labels/#{usergroup.label_id}/.gitkeep"))
    FileUtils.touch(Rails.root.join("app/assets/javascripts/labels/#{usergroup.label_id}.coffee"))
    FileUtils.mkdir_p(Rails.root.join("app/assets/javascripts/labels/#{usergroup.label_id}"))
    FileUtils.touch(Rails.root.join("app/assets/javascripts/labels/#{usergroup.label_id}/.gitkeep"))

    puts "now add '127.0.0.1 #{name}.onruby.dev' to your /etc/hosts, run 'foreman start' and run 'open #{name}.onruby.dev:5000'"
  end
end
