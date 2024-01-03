FactoryBot.define do
    factory :post do
      title { 'abhishekh' }
      content { 'miya kalifa' }
      association :author
    end
  end