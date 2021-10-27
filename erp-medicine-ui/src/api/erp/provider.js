import request from '@/utils/request'

// 分页查询
export function listProviderForPage(query) {
  return request({
    url: '/erp/provider/listProviderForPage',
    method: 'get',
    params: query
  })
}
// 添加
export function addProvider(data) {
  return request({
    url: '/erp/provider/addProvider',
    method: 'post',
    params: data
  })
}
// 修改
export function updateProvider(data) {
  return request({
    url: '/erp/provider/updateProvider',
    method: 'put',
    params: data
  })
}
// 删除
export function deleteProviderByIds(id) {
  return request({
    url: '/erp/provider/deleteProviderByIds/' + id,
    method: 'delete'
  })
}
// 查询一个
export function getProviderById(id) {
  return request({
    url: '/erp/provider/getProviderById/' + id,
    method: 'get'
  })
}
// 查询所有有效的供应商信息
export function selectAllProvider() {
  return request({
    url: '/erp/provider/selectAllProvider',
    method: 'get'
  })
}
