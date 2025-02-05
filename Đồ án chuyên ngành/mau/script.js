// @ts-nocheck
const labels = ['January','February','March','April','May','June','July','August','September','November','December']

const data = {
  labels:labels,
  datasets:[
    {
      labels:'Lượt bán hàng',
      backgroundColor : 'blue',
      borderColor : 'blue',
      data: [10,27,56,34,24,53 ],
      tension: 0.4,
    },

    {
      labels:'Lượt bán hàng',
      backgroundColor : 'red',
      borderColor : 'red',
      data: [5,17,36,54,64,43 ],
      tension: 0.4,
    },

    {
      labels:'Lượt da mua',
      backgroundColor : 'blue',
      borderColor : 'blue',
      data: [10,27,56,34,24,53 ],
      tension: 0.4,
    },

    {
      labels:'Lượt da huy',
      backgroundColor : 'dark',
      borderColor : 'dark',
      data: [3,8,3,5,12,8 ],
      tension: 0.4,
    },
  ],
}
const config = {
  type:'line',
  data: data,
}

const canvas = document.getElementById('canvas')
const chart = new charts(canvas,config)