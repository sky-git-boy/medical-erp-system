<template>
  <div class="app-container">
    <el-tabs v-model="activeName" :stretch="true" @tab-click="handleClick">
      <el-tab-pane label="药品总库存" name="medicinesTab">
        <!-- 查询条件开始 -->
        <el-form ref="queryForm" :model="queryParams" :inline="true" label-width="68px">
          <el-form-item label="药品名称" prop="medicinesName">
            <el-input
              v-model="queryParams.medicinesName"
              placeholder="请输入药品名称"
              clearable
              size="small"
              style="width:180px"
            />
          </el-form-item>
          <el-form-item label="关键字" prop="keywords">
            <el-input
              v-model="queryParams.keywords"
              placeholder="请输入关键字"
              clearable
              size="small"
              style="width:180px"
            />
          </el-form-item>
          <el-form-item label="药品类型" prop="medicinesType">
            <el-select
              v-model="queryParams.medicinesType"
              placeholder="药品类型"
              clearable
              size="small"
              style="width:180px"
            >
              <el-option
                v-for="dict in medicinesTypeOptions"
                :key="dict.dictValue"
                :label="dict.dictLabel"
                :value="dict.dictValue"
              />
            </el-select>
          </el-form-item>
          <el-form-item label="生产厂家" prop="producerId">
            <el-select
              v-model="queryParams.producerId"
              placeholder="生产厂家"
              clearable
              size="small"
              style="width:180px"
            >
              <el-option
                v-for="dict in producerOptions"
                :key="dict.producerId"
                :label="dict.producerName"
                :value="dict.producerId"
              />
            </el-select>
          </el-form-item>
          <el-form-item label="处方类型" prop="prescriptionType">
            <el-select
              v-model="queryParams.prescriptionType"
              placeholder="处方类型"
              clearable
              size="small"
              style="width:180px"
            >
              <el-option
                v-for="dict in prescriptionTypeOptions"
                :key="dict.dictValue"
                :label="dict.dictLabel"
                :value="dict.dictValue"
              />
            </el-select>
          </el-form-item>
          <el-form-item label="创建时间">
            <el-date-picker
              v-model="dateRange"
              size="small"
              style="width:240px"
              value-format="yyyy-MM-dd"
              type="daterange"
              range-separator="-"
              start-placeholde="开始日期"
              end-placeholde="结束日期"
            />
          </el-form-item>
          <el-form-item>
            <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
            <el-button type="primary" icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
          </el-form-item>
        </el-form>
        <!-- 查询条件结束 -->
        <!-- 数据表格开始 -->
        <el-table v-loading="loading" border :data="medicinesTableList">
          <el-table-column label="药品ID" align="center" prop="medicinesId" />
          <el-table-column label="药品名称" align="center" prop="medicinesName" />
          <el-table-column label="药品编号" align="center" prop="medicinesNumber" />
          <el-table-column label="生产厂家" width="280px" align="center" prop="producerId" :formatter="producerFormatter" />
          <el-table-column label="药品类型" align="center" prop="medicinesType" :formatter="medicinesTypeFormatter" />
          <el-table-column label="处方类型" align="center" prop="prescriptionType" :formatter="prescriptionTypeFormatter" />
          <el-table-column label="关键字" align="center" prop="keywords" />
          <el-table-column label="库存量" align="center" prop="medicinesStockNum" />
          <el-table-column label="预警值" align="center" prop="medicinesStockDangerNum" />
          <el-table-column label="状态" prop="status" align="center" :formatter="statusFormatter" />
        </el-table>
        <!-- 数据表格结束 -->
        <!-- 分页控件开始 -->
        <el-pagination
          v-show="total>0"
          :current-page="queryParams.pageNum"
          :page-sizes="[5, 10, 20, 30]"
          :page-size="queryParams.pageSize"
          layout="total, sizes, prev, pager, next, jumper"
          :total="total"
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
        />
        <!-- 分页控件结束 -->
      </el-tab-pane>
      <el-tab-pane label="批次库存及价格" name="inventoryLogTab">
        <!-- 查询条件开始 -->
        <el-form ref="queryLogForm" :model="queryLogParams" :inline="true" label-width="88px">
          <el-form-item label="采购单据号" prop="purchaseId">
            <el-input
              v-model="queryLogParams.purchaseId"
              placeholder="采购单据号"
              clearable
              size="small"
              style="width:180px"
            />
          </el-form-item>
          <el-form-item label="药品名称" prop="medicinesName">
            <el-input
              v-model="queryLogParams.medicinesName"
              placeholder="请输入药品名称"
              clearable
              size="small"
              style="width:180px"
            />
          </el-form-item>
          <el-form-item label="药品类型" prop="medicinesType">
            <el-select
              v-model="queryLogParams.medicinesType"
              placeholder="药品类型"
              clearable
              size="small"
              style="width:180px"
            >
              <el-option
                v-for="dict in medicinesTypeOptions"
                :key="dict.dictValue"
                :label="dict.dictLabel"
                :value="dict.dictValue"
              />
            </el-select>
          </el-form-item>
          <el-form-item label="生产厂家" prop="producerId">
            <el-select
              v-model="queryLogParams.producerId"
              placeholder="生产厂家"
              clearable
              size="small"
              style="width:180px"
            >
              <el-option
                v-for="dict in producerOptions"
                :key="dict.producerId"
                :label="dict.producerName"
                :value="dict.producerId"
              />
            </el-select>
          </el-form-item>
          <el-form-item label="处方类型" prop="prescriptionType">
            <el-select
              v-model="queryLogParams.prescriptionType"
              placeholder="处方类型"
              clearable
              size="small"
              style="width:180px"
            >
              <el-option
                v-for="dict in prescriptionTypeOptions"
                :key="dict.dictValue"
                :label="dict.dictLabel"
                :value="dict.dictValue"
              />
            </el-select>
          </el-form-item>
          <el-form-item label="创建时间">
            <el-date-picker
              v-model="dateRange"
              size="small"
              style="width:240px"
              value-format="yyyy-MM-dd"
              type="daterange"
              range-separator="-"
              start-placeholde="开始日期"
              end-placeholde="结束日期"
            />
          </el-form-item>
          <el-form-item>
            <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
            <el-button type="primary" icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
          </el-form-item>
        </el-form>
        <!-- 查询条件结束 -->
        <!-- 数据表格开始 -->
        <el-table v-loading="loading" border :data="inventoryLogTableList">
          <el-table-column type="expand">
            <template slot-scope="props">
              <el-form label-position="left" inline class="demo-table-expand">
                <el-form-item label="入库号">
                  <span>{{ props.row.inventoryLogId }}</span>
                </el-form-item>
                <el-form-item label="单据号">
                  <span>{{ props.row.purchaseId }}</span>
                </el-form-item>
                <el-form-item label="规格">
                  <span>{{ props.row.conversion }}{{ props.row.unit }}</span>
                </el-form-item>
              </el-form>
            </template>
          </el-table-column>
          <el-table-column label="药品ID" align="center" prop="medicinesId" />
          <el-table-column label="药品名称" align="center" prop="medicinesName" />
          <el-table-column label="采购量" align="center" prop="inventoryLogNum" />
          <el-table-column label="批发价" align="center" prop="tradePrice">
            <template slot-scope="scope">
              <span>{{ scope.row.tradePrice|rounding }}</span>
            </template>
          </el-table-column>
          <el-table-column label="批发额" align="center" prop="tradeTotalAmount">
            <template slot-scope="scope">
              <span>{{ scope.row.tradeTotalAmount|rounding }}</span>
            </template>
          </el-table-column>
          <el-table-column label="批次号" align="center" prop="batchNumber" />
          <el-table-column label="生产厂家" width="280px" align="center" prop="producerId" :formatter="producerFormatter" />
          <el-table-column label="药品类型" align="center" prop="medicinesType" :formatter="medicinesTypeFormatter" />
          <el-table-column label="处方类型" align="center" prop="prescriptionType" :formatter="prescriptionTypeFormatter" />
          <el-table-column label="入库时间" width="180px" align="center" prop="createTime" />
        </el-table>
        <!-- 数据表格结束 -->
        <!-- 分页控件开始 -->
        <el-pagination
          v-show="totalLog>0"
          :current-page="queryLogParams.pageNum"
          :page-sizes="[5, 10, 20, 30]"
          :page-size="queryLogParams.pageSize"
          layout="total, sizes, prev, pager, next, jumper"
          :total="totalLog"
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
        />
        <!-- 分页控件结束 -->
      </el-tab-pane>
    </el-tabs>
  </div>
</template>
<script>
// 引入api
import { selectAllProducer } from '@/api/erp/producer'
import { listMedicinesForPage } from '@/api/erp/medicines'
import { listInventoryLogForPage } from '@/api/erp/inventoryLog'
export default {
  filters: {
    rounding(value) {
      return value.toFixed(2)
    }
  },
  // 定义页面数据
  data() {
    return {
      // 当前激活的tab
      activeName: 'medicinesTab',
      // 是否启用遮罩层
      loading: false,
      // 药品分页数据总条数
      total: 0,
      // 入库分页数据总条数
      totalLog: 0,
      // 字典表格数据
      medicinesTableList: [],
      // 字典表格数据
      inventoryLogTableList: [],
      // 状态数据字典
      statusOptions: [],
      // 药品类型数据字典
      medicinesTypeOptions: [],
      // 生产厂家数据
      producerOptions: [],
      // 处方类型数字典
      prescriptionTypeOptions: [],
      // 药品查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        medicinesName: undefined,
        medicinesType: undefined,
        prescriptionType: undefined,
        producerId: undefined
      },
      // 入库详情查询参数
      queryLogParams: {
        pageNum: 1,
        pageSize: 10,
        purchaseId: undefined,
        medicinesName: undefined,
        medicinesType: undefined,
        prescriptionType: undefined,
        producerId: undefined
      },
      dateRange: []
    }
  },
  // 勾子
  created() {
    // 使用全局的根据字典类型查询字典数据的方法查询字典数据
    this.getDataByType('sys_normal_disable').then(res => {
      this.statusOptions = res.data
    })
    // 查询药品分类字典数据
    this.getDataByType('his_medicines_type').then(res => {
      this.medicinesTypeOptions = res.data
    })
    // 查询药品处方分类字典数据
    this.getDataByType('his_prescription_type').then(res => {
      this.prescriptionTypeOptions = res.data
    })
    // 查询所有可用的生产厂家
    selectAllProducer().then(res => {
      this.producerOptions = res.data
    })
    // 查询表格数据
    this.getMedicinesList()
  },
  // 方法
  methods: {
    // 点击tab调用的事件
    handleClick(tab, event) {
      if (this.activeName === 'medicinesTab') {
        this.getMedicinesList()
      } else if (this.activeName === 'inventoryLogTab') {
        this.getInventoryLogList()
      }
    },
    // 查询药品表格数据
    getMedicinesList() {
      this.loading = true // 打开遮罩
      listMedicinesForPage(this.queryParams).then(res => {
        this.medicinesTableList = res.data
        this.total = res.total
        this.loading = false// 关闭遮罩
      })
    },
    // 查询入库记录表格数据
    getInventoryLogList() {
      this.loading = true // 打开遮罩
      listInventoryLogForPage(this.addDateRange(this.queryLogParams, this.dateRange)).then(res => {
        this.inventoryLogTableList = res.data
        this.totalLog = res.total
        this.loading = false// 关闭遮罩
      })
    },
    // 药品条件查询
    handleQuery() {
      if (this.activeName === 'medicinesTab') {
        this.getMedicinesList()
      } else if (this.activeName === 'inventoryLogTab') {
        this.getInventoryLogList()
      }
    },
    // 药品重置查询条件
    resetQuery() {
      if (this.activeName === 'medicinesTab') {
        this.resetForm('queryForm')
        this.getMedicinesList()
      } else if (this.activeName === 'inventoryLogTab') {
        this.resetForm('queryLogForm')
        this.dateRange = []
        this.getInventoryLogList()
      }
    },
    // 分页pageSize变化时触发
    handleSizeChange(val) {
      if (this.activeName === 'medicinesTab') {
        this.queryParams.pageSize = val
        this.getMedicinesList()
      } else if (this.activeName === 'inventoryLogTab') {
        this.queryLogParams.pageSize = val
        this.getInventoryLogList()
      }
    },
    // 点击上一页  下一页，跳转到哪一页面时触发
    handleCurrentChange(val) {
      if (this.activeName === 'medicinesTab') {
        this.queryParams.pageNum = val
        this.getMedicinesList()
      } else if (this.activeName === 'inventoryLogTab') {
        this.queryLogParams.pageNum = val
        this.getInventoryLogList()
      }
    },
    // 翻译状态
    statusFormatter(row) {
      return this.selectDictLabel(this.statusOptions, row.status)
    },
    // 翻译生产厂家
    producerFormatter(row) {
      let name = ''
      this.producerOptions.filter(item => {
        if (parseInt(item.producerId) === parseInt(row.producerId)) {
          name = item.producerName
        }
      })
      return name
    },
    // 翻译药品类型
    medicinesTypeFormatter(row) {
      return this.selectDictLabel(this.medicinesTypeOptions, row.medicinesType)
    },
    // 翻译处方类型
    prescriptionTypeFormatter(row) {
      return this.selectDictLabel(this.prescriptionTypeOptions, row.prescriptionType)
    }
  }
}
</script>
<style scoped>
  .demo-table-expand {
    font-size: 0;
  }
  .demo-table-expand label {
    width: 90px;
    color: #99a9bf;
  }
  .demo-table-expand .el-form-item {
    margin-right: 0;
    margin-bottom: 0;
    width: 50%;
  }
</style>
