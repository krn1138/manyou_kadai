FactoryBot.define do
  factory :label do
    title { "sample1" }
  end

  factory :label_two,class: Label do
    title { "sample2" }
  end

  factory :label_three,class: Label do
    title { "sample3" }
  end
end
