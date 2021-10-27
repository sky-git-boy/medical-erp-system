import request from '@/utils/request'

// 分页查询
export function listMedicinesForPage(query) {
  return request({
    url: '/erp/medicines/listMedicinesForPage',
    method: 'get',
    params: query
  })
}
// 添加
export function addMedicines(data) {
  return request({
    url: '/erp/medicines/addMedicines',
    method: 'post',
    params: data
  })
}
// 修改
export function updateMedicines(data) {
  return request({
    url: '/erp/medicines/updateMedicines',
    method: 'put',
    params: data
  })
}
// 删除
export function deleteMedicinesByIds(id) {
  return request({
    url: '/erp/medicines/deleteMedicinesByIds/' + id,
    method: 'delete'
  })
}
// 查询一个
export function getMedicinesById(id) {
  return request({
    url: '/erp/medicines/getMedicinesById/' + id,
    method: 'get'
  })
}
// 查询所有有效的药品信息
export function selectAllMedicines() {
  return request({
    url: '/erp/medicines/selectAllMedicines',
    method: 'get'
  })
}
// 调整药品库存
export function updateMedicinesStorage(medicinesId, medicinesStockNum) {
  return request({
    url: '/erp/medicines/updateMedicinesStorage/' + medicinesId + '/' + medicinesStockNum,
    method: 'post'
  })
}
