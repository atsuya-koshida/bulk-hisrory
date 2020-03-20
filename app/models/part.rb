class Part < ActiveHash::Base
  self.data = [
    {id: 1, name: '胸'}, {id: 2, name: '肩'},
    {id: 3, name: '背中'}, {id: 4, name: '腕'},
    {id: 5, name: '腹'}, {id: 6, name: '足'},
    {id: 7, name: 'その他'}
  ]
end