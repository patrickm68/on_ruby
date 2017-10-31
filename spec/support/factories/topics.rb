FactoryBot.define do
  factory :proposal, class: :topic do
    name            { Faker::Lorem.words(5).join }
    description     { Faker::Lorem.sentences(3).join }
    proposal_type   'proposal'
    association     :user
  end

  factory :topic, parent: :proposal do
    association     :event
  end
end
