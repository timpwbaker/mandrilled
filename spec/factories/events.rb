require 'date'

FactoryGirl.define do
  factory :event do
    address { "jamesdean@eastofeden.com" }

    trait :now do
      timestamp { DateTime.current}
    end

    trait :yesterday do
      timestamp { DateTime.current  - 1.day }
    end

    trait :shipment do
      email_type { "Shipment" }
    end

    trait :user_confirmation do
      email_type { "UserConfirmation" }
    end

    trait :order do
      email_type { "Order" }
    end

    trait :get_a_book_discount do
      email_type { "GetABookDiscount" }
    end

    trait :refer_a_friend do
      email_type { "ReferAFriend" }
    end

    trait :send do
      event { "send" }
    end

    trait :open do
      event { "open" }
    end

    trait :click do
      event { "click" }
    end
  end
end
