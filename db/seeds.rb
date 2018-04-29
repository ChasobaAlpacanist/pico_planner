time0 = Time.current.beginning_of_day

PlanItem.create!(
  name: '読書',
  description: '「橋メロ」をよむ',
  starts_at: time0.advance(days: 1, hours: 10),
  ends_at: time0.advance(days: 1, hours: 11)
)

item = PlanItem.new
item.name = 'a'
item.description = "aa.\naaa"
item.starts_at = time0.beginning_of_year.advance(years: 1, days: -2)
item.ends_at = time0.beginning_of_year.advance(years: 1, days: 3)
item.save!

item = PlanItem.new
item.name = 'b'
item.description = 'bb'
item.starts_at = time0.advance(days: 1, hours: 10)
item.ends_at = time0.advance(days: 1, hours: 11)
item.save!

PlanItem.create!(
  name: 'DVD',
  description: '未定',
  starts_at: time0.advance(hours: 23),
  ends_at: time0.advance(hours: 25)
)

PlanItem.create!(
  name: '出張',
  description: '札幌',
  starts_at: time0.advance(years: -1, hours: 10),
  ends_at: time0.advance(years: 1, hours: 6)
)
