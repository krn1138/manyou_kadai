FactoryBot.define do
  factory :label do
    title { sample_label1 }
  end

  factory :label_two,class: Label do
    title { sample_label2 }
  end
end
