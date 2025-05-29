class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '観光地' },
    { id: 3, name: 'グルメ' },
    { id: 4, name: 'カフェ' },
    { id: 5, name: '自然・絶景' },
    { id: 6, name: '温泉・スパ' },
    { id: 7, name: 'ショッピング' },
    { id: 8, name: '穴場スポット' },
    { id: 9, name: 'いきものとふれあう' },
    { id: 10, name: 'ミュージアムめぐり' },
    { id: 11, name: '軽食・屋台・街歩きフード' },
    { id: 12, name: '夜景・ライトアップ' }
  ]

  include ActiveHash::Associations
  has_many :spots
end
