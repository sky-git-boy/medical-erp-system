import request from '@/utils/request'

// 分页查询所有的采购入库数据
export function listInventoryLogForPage(query) {
  return request({
    url: '/erp/inventoryLog/listInventoryLogForPage',
    method: 'get',
    params: query
  })
}
