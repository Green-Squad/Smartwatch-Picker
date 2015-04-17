phone_oses = ['Android', 'iOS', 'Windows']

phone_oses.each do |phone_os|
  PhoneOs.create(name: phone_os)
end

smartwatches = [{name: 'LG G Watch', battery_life: 1, engadget_score: 68, release_date: Date.new(2014, 6, 25), image_path: 'smartwatches/lg-g-watch.png',
                 amazon_url: 'http://www.amazon.com/gp/product/B00LGJ9JRO/ref=as_li_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B00LGJ9JRO&linkCode=as2&tag=gresqu-20&linkId=Z7IWNJ37PNTJIXXV',
                 notes: 'Requires Android 4.3+', phone_oses: ['Android']
                },
                {name: 'Samsung Gear Live', battery_life: 1, engadget_score: 73, release_date: Date.new(2014, 6, 25), image_path: 'smartwatches/samsung-gear-live.png',
                 amazon_url: 'http://www.amazon.com/gp/product/B00LTR5HP6/ref=as_li_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B00LTR5HP6&linkCode=as2&tag=gresqu-20&linkId=O2JUL6TIKNIU35VS',
                 notes: 'Requires Android 4.3+', phone_oses: ['Android']
                },
                {name: 'Moto 360', battery_life: 1, engadget_score: 76, release_date: Date.new(2014, 9, 5), image_path: 'smartwatches/moto-360.png',
                 amazon_url: 'http://www.amazon.com/gp/product/B00NC8PMUK/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=B00NC8PMUK&linkCode=as2&tag=gresqu-20&linkId=YRV73ILBN6V2I77I',
                 notes: 'Requires Android 4.3+', phone_oses: ['Android']
                },
                {name: 'LG G Watch R', battery_life: 1, engadget_score: 76, release_date: Date.new(2014, 11, 5), image_path: 'smartwatches/lg-g-watch-r.png',
                 amazon_url: 'http://www.amazon.com/gp/product/B00PLY8RYG/ref=as_li_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B00PLY8RYG&linkCode=as2&tag=gresqu-20&linkId=FGSKTMBTMJYBRTMG',
                 notes: 'Requires Android 4.3+', phone_oses: ['Android']
                },
                {name: 'ASUS ZenWatch', battery_life: 1, engadget_score: 75, release_date: Date.new(2014, 11, 9), image_path: 'smartwatches/asus-zenwatch.png',
                 amazon_url: 'http://www.amazon.com/gp/product/B00TCVHGZU/ref=as_li_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B00TCVHGZU&linkCode=as2&tag=gresqu-20&linkId=KFTEW2FM5ZO7WZNN',
                 notes: 'Requires Android 4.3+', phone_oses: ['Android']
                },
                {name: 'Sony SmartWatch 3', battery_life: 2, engadget_score: 76, release_date: Date.new(2014, 11, 10), image_path: 'smartwatches/sony-smartwatch-3.png',
                 amazon_url: 'http://www.amazon.com/gp/product/B00N9OAQI0/ref=as_li_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B00N9OAQI0&linkCode=as2&tag=gresqu-20&linkId=FYUXCOI767LM6U7Q',
                 notes: 'Requires Android 4.3+', phone_oses: ['Android']
                },
                {name: 'Pebble', battery_life: 7, engadget_score: 80, release_date: Date.new(2013, 1, 23), image_path: 'smartwatches/pebble.png',
                 amazon_url: 'http://www.amazon.com/gp/product/B00BKEQBI0/ref=as_li_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B00BKEQBI0&linkCode=as2&tag=gresqu-20&linkId=I4LVIARQFOEYNRYA',
                 notes: 'Requires Android 4.1+ or iPhone 4 (or newer) with iOS 6.0+', phone_oses: ['Android', 'iOS']
                },
                {name: 'Pebble Steel', battery_life: 7, engadget_score: 85, release_date: Date.new(2014, 1, 28), image_path: 'smartwatches/pebble-steel.png',
                 amazon_url: 'http://www.amazon.com/gp/product/B00KVHEL8E/ref=as_li_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B00KVHEL8E&linkCode=as2&tag=gresqu-20&linkId=JXWFEP2IOMHCU2ME',
                 notes: 'Requires Android 4.1+ or iPhone 4 (or newer) with iOS 6.0+', phone_oses: ['Android', 'iOS']
                },
                {name: 'Microsoft Band', battery_life: 2, engadget_score: 65, release_date: Date.new(2014, 10, 29), image_path: 'smartwatches/microsoft-band.png',
                 amazon_url: 'http://www.amazon.com/gp/product/B00P2S2M88/ref=as_li_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B00P2S2M88&linkCode=as2&tag=gresqu-20&linkId=MXK42QGMCH6F26IK',
                 notes: 'Requires Android 4.3+, iPhone 4S (or newer) with iOS 7.1+, or Windows Phone 8.1+', phone_oses: ['Android', 'iOS', 'Windows']
                },
                {name: 'Samsung Gear Fit', battery_life: 3, engadget_score: 62, release_date: Date.new(2014, 4, 11), image_path: 'smartwatches/samsung-gear-fit.png',
                 amazon_url: 'http://www.amazon.com/gp/product/B00JBJ3JBI/ref=as_li_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B00JBJ3JBI&linkCode=as2&tag=gresqu-20&linkId=Q545EQN34WFBRMHX',
                 notes: 'Compatible with various Samsung Galaxy smartphones and tablets', phone_oses: ['Android']
                },
                {name: 'Samsung Gear 2', battery_life: 3, engadget_score: 71, release_date: Date.new(2014, 4, 11), image_path: 'smartwatches/samsung-gear-2.png',
                 amazon_url: 'http://www.amazon.com/gp/product/B00JBJ3HQ0/ref=as_li_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B00JBJ3HQ0&linkCode=as2&tag=gresqu-20&linkId=JYCGRDCQ62WINEPZ',
                 notes: 'Compatible with various Samsung Galaxy smartphones and tablets', phone_oses: ['Android']
                },
                {name: 'Samsung Gear 2 Neo', battery_life: 3, engadget_score: 72, release_date: Date.new(2014, 4, 11), image_path: 'smartwatches/samsung-gear-2-neo.png',
                 amazon_url: 'http://www.amazon.com/gp/product/B00JBJ3I4Q/ref=as_li_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B00JBJ3I4Q&linkCode=as2&tag=gresqu-20&linkId=N2YZU4F7CX5362SE',
                 notes: 'Compatible with various Samsung Galaxy smartphones and tablets', phone_oses: ['Android']
                },
                {name: 'Samsung Gear S', battery_life: 2, engadget_score: 65, release_date: Date.new(2014, 11, 7), image_path: 'smartwatches/samsung-gear-s.png',
                 amazon_url: 'http://www.amazon.com/gp/product/B00PHPW1NC/ref=as_li_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B00PHPW1NC&linkCode=as2&tag=gresqu-20&linkId=ZAT6O6IADD5GVQTP',
                 notes: 'Compatible with various Samsung Galaxy smartphones and tablets', phone_oses: ['Android']
                }#,
                #{name: 'Apple Watch', battery_life: 0.75, engadget_score: , release_date: Date.new(2015, 4, 24), image_path: '',
                # amazon_url: '',
                # notes: '', phone_oses: ['']
                # },
                #{name: 'Garmin Vivoactive', battery_life: 21, engadget_score:, release_date: Date.new(2015, 1, 6), image_path: '',
                # amazon_url: 'http://www.amazon.com/gp/product/B00RE1UL52/ref=as_li_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B00RE1UL52&linkCode=as2&tag=gresqu-20&linkId=IY3SW2A2XJ3NOAPZ',
                # notes: '', phone_oses: ['']
                # }
                ]


smartwatches.each do |smartwatch|
  phone_oses = smartwatch.delete(:phone_oses)
  smartwatch = Smartwatch.create(smartwatch)
  phone_oses.each do |phone_os|
    phone_os_id = PhoneOs.where(name: phone_os).first.id
    SupportedOs.create(phone_os_id: phone_os_id, smartwatch_id: smartwatch.id)
  end
end

Smartwatch.update_prices

