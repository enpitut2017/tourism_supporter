Spot.create!(placeName:  "筑波大学嘉納治五郎像",
             detail_comment: '嘉納治五郎先生は1860年12月に生まれ、東京帝国大学を卒業後、講道館柔道を創設しました。
              その後、本学の前身である高等師範学校・東京高等師範学校の校長を３期23年半にわたって務め、
              教育改革を行いつつ、日本の学校教育の充実、体育・スポーツの発展、そしてオリンピック・ムーブメントの推進に活躍しました。
              筑波大学には彼の偉業を讃え、銅像が設置されています。',
             lat: 36.105469,
             lng: 140.102282,
             picture: open("#{Rails.root}/public/sample1.jpg"))

Spot.create!(placeName:  "附属病院けやき棟から",
             detail_comment: '比較的高い棟であるため、非常に眺めがよく、写真撮影にも適しています。筑波大の隠れスポットです。',
             lat: 36.092247,
             lng: 140.102209,
             picture: open("#{Rails.root}/public/sampletsukuba.jpg"))

Spot.create!(placeName:  "一の矢エリアの並木道",
             detail_comment: '一の矢エリアは筑波大の自然の多さを体感することができます。
              特に永遠と続く並木道は圧巻です。大学なのか森なのか。',
             lat: 36.119330,
             lng: 140.099204,
             picture: open("#{Rails.root}/public/sampletsukuba2.jpg"))

Advice.create!(spot_id: 1,
               picture: open("#{Rails.root}/public/sample1.jpg"),
               comment: "斜め下から撮りましょう")

Advice.create!(spot_id: 2,
               picture: open("#{Rails.root}/public/sampletsukuba.jpg"),
               comment: "黄昏時の大学と筑波山。夕暮れ時がおすすめです。")

Advice.create!(spot_id: 3,
               picture: open("#{Rails.root}/public/sampletsukuba2.jpg"),
               comment: "夏、よく晴れた日に撮りましょう！")

Advice.create!(spot_id: 3,
               picture: open("#{Rails.root}/public/sampletsukuba2.jpg"),
               comment: "緑が鮮やかになるように彩度を調整しましょう。")
