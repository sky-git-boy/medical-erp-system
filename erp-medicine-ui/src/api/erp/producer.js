import request from '@/utils/request'

// 分页查询
export function listProducerForPage(query) {
  return request({
    url: '/erp/producer/listProducerForPage',
    method: 'get',
    params: query
  })
}
// 添加
export function addProducer(data) {
  return request({
    url: '/erp/producer/addProducer',
    method: 'post',
    params: data
  })
}
// 修改
export function updateProducer(data) {
  return request({
    url: '/erp/producer/updateProducer',
    method: 'put',
    params: data
  })
}
// 删除
export function deleteProducerByIds(id) {
  return request({
    url: '/erp/producer/deleteProducerByIds/' + id,
    method: 'delete'
  })
}
// 查询一个
export function getProducerById(id) {
  return request({
    url: '/erp/producer/getProducerById/' + id,
    method: 'get'
  })
}
// 查询所有有效的生产厂家信息
export function selectAllProducer() {
  return request({
    url: '/erp/producer/selectAllProducer',
    method: 'get'
  })
}
