Spot.create!(placeName:  "筑波大学嘉納治五郎像",
             lat: 36.105469,
             lng: 140.102282,
             picture: '/sample1.jpg')

Spot.create!(placeName:  "附属病院けやき棟から",
             lat: 36.092247,
             lng: 140.102209,
             picture: '/sampletsukuba.jpg')

Spot.create!(placeName:  "一の矢エリアの並木道",
             lat: 36.119330,
             lng: 140.099204,
             picture: '/sampletsukuba2.jpg')

Advice.create!(spot_id: 1,
               pictureURL: '/sample1.jpg',
               comment: "斜め下から撮りましょう")

Advice.create!(spot_id: 2,
               pictureURL: '/sampletsukuba.jpg',
               comment: "黄昏時の大学と筑波山。夕暮れ時がおすすめです。")

Advice.create!(spot_id: 3,
               pictureURL: '/sampletsukuba2.jpg',
               comment: "夏、よく晴れた日に撮りましょう！")

Advice.create!(spot_id: 3,
               pictureURL: '/sampletsukuba2.jpg',
               comment: "緑が鮮やかになるように彩度を調整しましょう。")
