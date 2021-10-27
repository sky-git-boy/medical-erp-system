<template>
  <div class="app-container">
    <!-- 按钮开始 -->
    <el-card class="box-card">
      <div style="text-align:right;">
        <el-button type="primary" icon="el-icon-plus" :disabled="isSubmit" size="small" @click="handleAddMedicines">添加药物</el-button>
        <el-button type="success" icon="el-icon-s-operation" :disabled="isSubmit" size="small" @click="handleBatchSet">批量设置</el-button>
        <el-button type="danger" icon="el-icon-check" :disabled="isSubmit" size="small" @click="handleSubmit">暂存</el-button>
        <el-button type="warning" icon="el-icon-finished" :disabled="isSubmit" size="small" @click="handleSubmitAndAudit">提交审核</el-button>
      </div>
    </el-card>
    <!-- 按钮结束 -->

    <!-- 主表单开始 -->
    <el-card class="box-card">
      <el-form ref="form" :rules="rules" :model="form" :inline="true" label-width="68px">
        <el-row :gutter="10">
          <el-col :span="1.5">
            <el-form-item label="单据号" prop="purchaseId">
              <el-input
                v-model="form.purchaseId"
                placeholder="请输入单据号"
                :disabled="true"
                size="small"
                style="width:220px"
              />
            </el-form-item>
          </el-col>
          <el-col :span="1.5">
            <el-form-item label="供应商" prop="providerId">
              <el-select
                v-model="form.providerId"
                placeholder="请选择供应商"
                clearable
                size="small"
                style="width:220px"
              >
                <el-option
                  v-for="d in providerOptions"
                  :key="d.providerId"
                  :label="d.providerName"
                  :value="d.providerId"
                />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="1.5">
            <el-form-item label="总批发额" prop="purchaseTradeTotalAmount">
              <el-input
                v-model="form.purchaseTradeTotalAmount"
                placeholder="总批发额"
                :disabled="true"
                size="small"
                style="width:220px"
              />
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
    </el-card>
    <!-- 主表单结束 -->

    <!-- 选中的详情数据表格开始 -->
    <el-card class="box-card">
      <el-table
        :data="purchaseItemList"
        class="tb-edit"
        style="width:100%"
        border
        highlight-current-row
      >
        <el-table-column label="药品ID" align="center" width="80" prop="medicinesId" />
        <el-table-column label="药品名称" align="center" width="150" prop="medicinesName" />
        <el-table-column label="规则" align="center" width="80" prop="conversion">
          <template slot-scope="scope">
            <span>{{ scope.row.conversion }}{{ scope.row.unit }}</span>
          </template>
        </el-table-column>
        <el-table-column label="生产厂家" align="center" width="200" prop="producerId" :formatter="producerFormatter" />
        <el-table-column label="数量" align="center" width="160" prop="purchaseNumber">
          <template slot-scope="scope">
            <el-input-number
              v-model="scope.row.purchaseNumber"
              :step="1"
              size="small"
            />
          </template>
        </el-table-column>
        <el-table-column label="单位" align="center" width="80" prop="unit" />
        <el-table-column label="批发价" align="center" width="160" prop="tradePrice">
          <template slot-scope="scope">
            <el-input-number
              v-model="scope.row.tradePrice"
              :step="0.1"
              :precision="2"
              size="small"
            />
          </template>
        </el-table-column>
        <el-table-column label="批次额" align="center" width="80" prop="tradeTotalAmount">
          <template slot-scope="scope">
            <span>{{ scope.row.tradeTotalAmount|rounding }}</span>
            <!-- <span>{{ (scope.row.tradePrice * scope.row.purchaseNumber)|rounding }}</span> -->
          </template>
        </el-table-column>
        <el-table-column label="批次号" align="center" width="180" prop="batchNumber">
          <template slot-scope="scope">
            <el-input
              v-model="scope.row.batchNumber"
              size="small"
            />
          </template>
        </el-table-column>
        <el-table-column label="备注" align="center" width="180" prop="remark">
          <template slot-scope="scope">
            <el-input
              v-model="scope.row.remark"
              size="small"
            />
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center">
          <template slot-scope="scope">
            <el-button
              size="small"
              type="danger"
              :disabled="isSubmit"
              @click="handleDelete(scope.$index,scope.row)"
            >删除</el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-card>
    <!-- 选中的详情数据表格结束 -->

    <!-- 药品列表的弹出层开始 -->
    <el-dialog
      :title="title"
      :visible.sync="open"
      width="1100px"
      center
      append-to-body
    >
      <!-- 查询条件开始 -->
      <el-form ref="queryForm" :model="queryParams" :inline="true" label-width="68px">
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
            placeholder="请选择药品类型"
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
        <el-form-item label="处方类型" prop="prescriptionType">
          <el-select
            v-model="queryParams.prescriptionType"
            placeholder="请选择处方类型"
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
        <el-form-item style="margin-left:20px">
          <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
          <el-button type="primary" icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
        </el-form-item>
      </el-form>
      <!-- 查询条件结束 -->

      <!-- 药品数据表格开始 -->
      <el-table ref="medicinesTableList" v-loading="loading" border :data="medicinesTableList" @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="55" align="center" />
        <el-table-column label="药品ID" align="center" prop="medicinesId" />
        <el-table-column label="药品名称" align="center" prop="medicinesName" />
        <el-table-column label="药品编号" align="center" prop="medicinesNumber" />
        <el-table-column label="生产厂家" width="280px" align="center" prop="producerId" :formatter="producerFormatter" />
        <el-table-column label="药品类型" align="center" prop="medicinesType" :formatter="medicinesTypeFormatter" />
        <el-table-column label="处方类型" align="center" prop="prescriptionType" :formatter="prescriptionTypeFormatter" />
        <el-table-column label="关键字" align="center" prop="keywords" />
      </el-table>
      <!-- 药品数据表格结束 -->

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
    </el-dialog>
    <!-- 药品列表的弹出层结束 -->

    <!-- 批量设置的弹出层开始 -->
    <el-dialog
      :title="title"
      :visible.sync="batchSetOpen"
      width="500px"
      center
      append-to-body
    >
      <el-form ref="batchSetForm" :model="batchSetForm" label-width="100px">
        <el-form-item label="数量" prop="purchaseNumber">
          <el-input-number v-model="batchSetForm.purchaseNumber" placeholder="请输入数量" size="small" />
        </el-form-item>
        <el-form-item label="批发价格" prop="tradePrice">
          <el-input-number v-model="batchSetForm.tradePrice" :precision="2" placeholder="请输入数量" size="small" />
        </el-form-item>
        <el-form-item label="批次号" prop="batchNumber">
          <el-input v-model="batchSetForm.batchNumber" placeholder="请输入批次号" size="small" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="batchSetForm.remark" placeholder="请输入备注" size="small" />
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="handleBatchSetSubmit">确定</el-button>
        <el-button @click="cancelBatchSet">取消</el-button>
      </span>
    </el-dialog>
    <!-- 批量设置的弹出层结束 -->
  </div>
</template>

<script>
// 引入api
import { selectAllProvider } from '@/api/erp/provider'
import { listMedicinesForPage } from '@/api/erp/medicines'
import { generatePurchaseId, addPurchase, addPurchaseToAudit } from '@/api/erp/purchase'
import { selectAllProducer } from '@/api/erp/producer'
export default {
  // 过滤器
  filters: {
    rounding(value) {
      return value.toFixed(2)
    }
  },
  data() {
    return {
      // 加载
      loading: false,
      // 是否打开药品的弹出层
      open: false,
      // 总条数
      total: 0,
      // 弹出层标题
      title: '',
      // 是否已提交
      isSubmit: false,
      // 供应商的下拉列表数据
      providerOptions: [],
      // 生产厂家的列表数据
      producerOptions: [],
      // 药品类型的字典数据
      medicinesTypeOptions: [],
      // 处方类型的字典数据
      prescriptionTypeOptions: [],
      // 声明数据详情表格的数据
      purchaseItemList: [],
      // 药品表格数据
      medicinesTableList: [],
      // 主表单的数据
      form: {
        purchaseId: undefined,
        providerId: undefined,
        purchaseTradeTotalAmount: undefined
      },
      // 药品弹出层的查询条件
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        medicinesType: undefined,
        prescriptionType: undefined,
        keywords: undefined
      },
      // 弹出层选中的药品
      selectMedicines: [],
      // 是否显示批量设置的弹出层
      batchSetOpen: false,
      // 批量设置的数据绑定
      batchSetForm: {
        purchaseNumber: 0,
        tradePrice: 0.00,
        batchNumber: '',
        remark: ''
      },
      rules: {
        providerId: [
          { required: true, message: '请选择供应商', trigger: 'blur' }
        ]
      }
    }
  },
  // 监听purchaseItemList里面的数据变化，更新总批发额及批次额
  watch: {
    purchaseItemList: {
      handler: function() {
        this.form.purchaseTradeTotalAmount = 0.00
        this.purchaseItemList.filter(item => {
          item.tradeTotalAmount = item.tradePrice * item.purchaseNumber
          this.form.purchaseTradeTotalAmount += item.tradeTotalAmount
        })
      },
      deep: true
    }
  },
  // 勾子
  created() {
    // 查询供应商的数据
    selectAllProvider().then(res => {
      this.providerOptions = res.data
    })
    // 加载单据号
    generatePurchaseId().then(res => {
      this.form.purchaseId = res.msg
    })
    // 查询生产厂家的数据
    selectAllProducer().then(res => {
      this.producerOptions = res.data
    })
    // 查询药品分类字典数据
    this.getDataByType('his_medicines_type').then(res => {
      this.medicinesTypeOptions = res.data
    })
    // 查询药品处方分类字典数据
    this.getDataByType('his_prescription_type').then(res => {
      this.prescriptionTypeOptions = res.data
    })
  },
  // 方法
  methods: {
    // 翻译生产厂家
    producerFormatter(row) {
      let name = ''
      this.producerOptions.filter(item => {
        if (parseInt(row.producerId) === parseInt(item.producerId)) {
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
    },
    // 打开选择药品的弹出层
    handleAddMedicines() {
      this.open = true
      this.title = '选择要添加的药品信息'
      this.resetQuery()
      this.getMedicinesList()
    },
    // 查询药品数据
    getMedicinesList() {
      this.loading = true
      listMedicinesForPage(this.queryParams).then(res => {
        this.medicinesTableList = res.data
        this.total = res.total
        this.loading = false
        this.$nextTick(() => {
          // 反选之前有的
          this.medicinesTableList.filter(r1 => {
            this.purchaseItemList.filter(r2 => {
              if (parseInt(r1.medicinesId) === parseInt(r2.medicinesId)) {
                this.$refs.medicinesTableList.toggleRowSelection(r1, true)
              }
            })
          })
        })
      })
    },
    // 条件查询
    handleQuery() {
      this.getMedicinesList()
    },
    // 重置查询条件
    resetQuery() {
      this.resetForm('queryForm')
      this.getMedicinesList()
    },
    // 数据表格的多选择框选择时触发
    handleSelectionChange(selection) {
      this.selectMedicines = selection
      this.selectMedicines.filter(m1 => {
        let flag = false
        // 判断purchaseItemList里面有没有已选择的ID
        this.purchaseItemList.filter(purch => {
          if (m1.medicinesId === purch.medicinesId) {
            flag = true
          }
        })
        // 如果没有，就加入purchaseItemList
        if (!flag) {
          // 放到purchaseItemList对象是selection深度clone
          this.purchaseItemList.push(JSON.parse(JSON.stringify(m1)))
        }
      })
      // 剔除里面不用的属性，添加需要的属性
      this.purchaseItemList.filter(m => {
        this.$delete(m, 'status')
        this.$delete(m, 'medicinesStockNum')
        this.$delete(m, 'medicinesStockDangerNum')
        this.$delete(m, 'createTime')
        this.$delete(m, 'updateTime')
        this.$delete(m, 'createBy')
        this.$delete(m, 'updateBy')

        this.$set(m, 'purchaseNumber', m.purchaseNumber ? m.purchaseNumber : 1)
        this.$set(m, 'tradePrice', m.tradePrice ? m.tradePrice : 0.00)
        this.$set(m, 'tradeTotalAmount', m.tradeTotalAmount ? m.tradeTotalAmount : 0.00)
        this.$set(m, 'batchNumber', m.batchNumber ? m.batchNumber : '')
        this.$set(m, 'remark', m.remark ? m.remark : '')
      })
    },
    // 分页pageSize变化时触发
    handleSizeChange(val) {
      this.queryParams.pageSize = val
      // 重新查询
      this.getMedicinesList()
    },
    // 点击上一页  下一页，跳转到哪一页面时触发
    handleCurrentChange(val) {
      this.queryParams.pageNum = val
      // 重新查询
      this.getMedicinesList()
    },
    // 批量设置
    handleBatchSet() {
      this.batchSetOpen = true
      this.title = '批量设置'
      this.resetForm('batchSetForm')
    },
    // 批量设置中的确定
    handleBatchSetSubmit() {
      this.purchaseItemList.filter(item => {
        item.purchaseNumber = this.batchSetForm.purchaseNumber
        item.tradePrice = this.batchSetForm.tradePrice
        item.batchNumber = this.batchSetForm.batchNumber
        item.remark = this.batchSetForm.remark
      })
      this.batchSetOpen = false
    },
    // 批量设置中的取消
    cancelBatchSet() {
      this.batchSetOpen = false
    },
    // 暂存
    handleSubmit() {
      const tx = this
      if (tx.purchaseItemList.length > 0) {
        tx.$refs['form'].validate((valid) => {
          if (valid) {
            // 组装要提交到后台的数据
            const purchaseObj = { 'purchaseDto': tx.form, 'purchaseItemDtos': tx.purchaseItemList }
            addPurchase(purchaseObj).then(res => {
              tx.msgSuccess('暂存成功')
            }).catch(() => {
              tx.msgSuccess('暂存失败')
            })
          }
        })
      } else {
        tx.msgError('药品数据项不能为空')
      }
    },
    // 保存并提交审核
    handleSubmitAndAudit() {
      const tx = this
      if (tx.purchaseItemList.length > 0) {
        tx.$refs['form'].validate((valid) => {
          if (valid) {
            // 组装要提交到后台的数据
            const purcheseObj = { 'purchaseDto': tx.form, 'purchaseItemDtos': tx.purchaseItemList }
            addPurchaseToAudit(purcheseObj).then(res => {
              tx.msgSuccess('提交审核成功')
              // 上面的四个按钮不能按了
              tx.isSubmit = true
            }).catch(() => {
              tx.msgSuccess('提交审核失败')
            })
          }
        })
      } else {
        tx.msgError('药品数据项不能为空')
      }
    },
    // 删除详情数据
    handleDelete(index, row) {
      this.purchaseItemList.splice(index, 1)
    }
  }
}
</script>

<style scoped>
  .box-card{
    padding: 0px;
    margin: 0px;
    margin-bottom: 8px
  }
</style>
