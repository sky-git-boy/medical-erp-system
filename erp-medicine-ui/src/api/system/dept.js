import request from '@/utils/request'

// 分页查询
export function listDeptForPage(query) {
  return request({
    url: '/system/dept/listDeptForPage',
    method: 'get',
    params: query
  })
}
// 添加
export function addDept(data) {
  return request({
    url: '/system/dept/addDept',
    method: 'post',
    params: data
  })
}
// 修改
export function updateDept(data) {
  return request({
    url: '/system/dept/updateDept',
    method: 'put',
    params: data
  })
}
// 删除
export function deleteDeptByIds(id) {
  return request({
    url: '/system/dept/deleteDeptByIds/' + id,
    method: 'delete'
  })
}
// 查询一个
export function getDeptById(id) {
  return request({
    url: '/system/dept/getDeptById/' + id,
    method: 'get'
  })
}
// 查询所有有效的科室信息
export function selectAllDept() {
  return request({
    url: '/system/dept/selectAllDept',
    method: 'get'
  })
}
