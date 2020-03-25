class Quality < ActiveHash::Base
  self.data = [
    {id: 1, rate: '最高'}, {id: 2, rate: '良い'},
    {id: 3, rate: '普通'}, {id: 4, rate: '悪い'},
    {id: 5, rate: '最悪'}
  ]
end