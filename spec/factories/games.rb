FactoryBot.define do
  factory :game do
    status { 1 }
    rows { 1 }
    cols { 1 }
    mines { 1 }
    board { "" }
  end
end
