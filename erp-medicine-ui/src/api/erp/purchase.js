import request from '@/utils/request'

// 分页查询所有的采购单数据
export function listPurchaseForPage(query) {
  return request({
    url: '/erp/purchase/listPurchaseForPage',
    method: 'get',
    params: query
  })
}
// 分页查询所有的待审核采购单数据
export function listPurchasePendingForPage(query) {
  return request({
    url: '/erp/purchase/listPurchasePendingForPage',
    method: 'get',
    params: query
  })
}
// 提交审核【根据采购单号】
export function doAudit(purchaseId) {
  return request({
    url: '/erp/purchase/doAudit/' + purchaseId,
    method: 'post'
  })
}
// 作废【根据采购单号】
export function doInvalid(purchaseId) {
  return request({
    url: '/erp/purchase/doInvalid/' + purchaseId,
    method: 'post'
  })
}
// 审核通过【根据采购单号】
export function auditPass(purchaseId) {
  return request({
    url: '/erp/purchase/auditPass/' + purchaseId,
    method: 'post'
  })
}
// 审核不通过【根据采购单号】
export function auditNoPass(purchaseId, auditMsg) {
  return request({
    url: '/erp/purchase/auditNoPass/' + purchaseId + '/' + auditMsg,
    method: 'post'
  })
}
// 根据采购单据ID查询采购详情信息
export function getPurchaseItemById(purchaseId) {
  return request({
    url: '/erp/purchase/getPurchaseItemById/' + purchaseId,
    method: 'get'
  })
}
// 添加采购单和详情
export function addPurchase(data) {
  return request({
    url: '/erp/purchase/addPurchase/',
    method: 'post',
    data: data
  })
}
// 添加采购单和详情并提交审核
export function addPurchaseToAudit(data) {
  return request({
    url: '/erp/purchase/addPurchaseToAudit/',
    method: 'post',
    data: data
  })
}
// 根据采购单ID查询采购单信息和详情
export function queryPurchaseAndItemByPurchaseId(purchaseId) {
  return request({
    url: '/erp/purchase/queryPurchaseAndItemByPurchaseId/' + purchaseId,
    method: 'get'
  })
}
// 入库
export function doInventory(purchaseId) {
  return request({
    url: '/erp/purchase/doInventory/' + purchaseId,
    method: 'post'
  })
}
// 得到单据ID
export function getPurchaseId() {
  return request({
    url: '/erp/purchase/getPurchaseId',
    method: 'get'
  })
}
// 生成单据号
export function generatePurchaseId() {
  return request({
    url: '/erp/purchase/generatePurchaseId',
    method: 'get'
  })
}
