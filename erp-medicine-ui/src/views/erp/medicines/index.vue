<template>
  <div class="app-container">
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
      <el-form-item label="状态" prop="status">
        <el-select
          v-model="queryParams.status"
          placeholder="可用状态"
          clearable
          size="small"
          style="width:180px"
        >
          <el-option
            v-for="dict in statusOptions"
            :key="dict.dictValue"
            :label="dict.dictLabel"
            :value="dict.dictValue"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button type="primary" icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>
    <!-- 查询条件结束 -->

    <!-- 表格工具按钮开始 -->
    <el-row :gutter="10" style="margin-bottom: 8px;">
      <el-col :span="1.5">
        <el-button type="primary" icon="el-icon-plus" size="mini" @click="handleAdd">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" icon="el-icon-edit" size="mini" :disabled="single" @click="handleUpdate">修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" icon="el-icon-delete" size="mini" :disabled="multiple" @click="handleDelete">删除</el-button>
      </el-col>
    </el-row>
    <!-- 表格工具按钮结束 -->

    <!-- 数据表格开始 -->
    <el-table v-loading="loading" border :data="medicinesTableList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column type="expand">
        <template slot-scope="props">
          <el-form label-position="left" inline class="demo-table-expand">
            <el-form-item label="单位">
              <span>{{ props.row.unit }}</span>
            </el-form-item>
            <el-form-item label="换算量">
              <span>{{ props.row.conversion }}</span>
            </el-form-item>
            <el-form-item label="库存量">
              <span>{{ props.row.medicinesStockNum }}</span>
            </el-form-item>
            <el-form-item label="预警值">
              <span>{{ props.row.medicinesStockDangerNum }}</span>
            </el-form-item>
          </el-form>
        </template>
      </el-table-column>
      <el-table-column label="药品ID" align="center" prop="medicinesId" />
      <el-table-column label="药品名称" align="center" prop="medicinesName" />
      <el-table-column label="药品编号" align="center" prop="medicinesNumber" />
      <el-table-column label="生产厂家" width="220px" align="center" prop="producerId" :formatter="producerFormatter" />
      <el-table-column label="药品类型" align="center" prop="medicinesType" :formatter="medicinesTypeFormatter" />
      <el-table-column label="处方类型" align="center" prop="prescriptionType" :formatter="prescriptionTypeFormatter" />
      <el-table-column label="关键字" align="center" prop="keywords" />
      <el-table-column label="处方价格" align="center" prop="prescriptionPrice" />
      <el-table-column label="状态" prop="status" align="center" :formatter="statusFormatter" />
      <el-table-column label="操作" width="180px" align="center">
        <template slot-scope="scope">
          <el-button type="text" icon="el-icon-edit" size="mini" @click="handleUpdate(scope.row)">修改</el-button>
          <el-button type="text" icon="el-icon-delete" size="mini" @click="handleDelete(scope.row)">删除</el-button>
          <el-button type="text" icon="el-icon-plus" size="mini" @click="handleUpdateStorage(scope.row)">调整库存</el-button>
        </template>
      </el-table-column>
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

    <!-- 添加修改弹出层开始 -->
    <el-dialog
      :title="title"
      :visible.sync="open"
      width="800px"
      center
      append-to-body
    >
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="药品名称" prop="medicinesName">
              <el-input v-model="form.medicinesName" style="width:240px" placeholder="请输入药品名称" clearable size="small" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="药品编码" prop="medicinesNumber">
              <el-input v-model="form.medicinesNumber" style="width:240px" placeholder="请输入药品编码" clearable size="small" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="关键字" prop="keywords">
              <el-input v-model="form.keywords" style="width:240px" placeholder="请输入关键字" clearable size="small" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="单位" prop="unit">
              <el-input v-model="form.unit" style="width:240px" placeholder="请输入单位" clearable size="small" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="换算量" prop="conversion">
              <el-input v-model="form.conversion" style="width:240px" placeholder="请输入换算量" clearable size="small" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="处方价格" prop="prescriptionPrice">
              <el-input-number v-model="form.prescriptionPrice" style="width:240px" placeholder="请输入处方价格" size="small" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="预警值" prop="medicinesStockDangerNum">
              <el-input-number v-model="form.medicinesStockDangerNum" style="width:240px" placeholder="请输入预警值" size="small" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="状态" prop="status">
              <el-radio-group v-model="form.status" style="width:240px">
                <el-radio
                  v-for="dict in statusOptions"
                  :key="dict.dictValue"
                  :label="dict.dictValue"
                  :value="dict.dictValue"
                >{{ dict.dictLabel }}</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="药品类型" prop="medicinesType">
              <el-select
                v-model="form.medicinesType"
                style="width:240px"
                placeholder="药品类型"
                size="small"
              >
                <el-option
                  v-for="dict in medicinesTypeOptions"
                  :key="dict.dictValue"
                  :label="dict.dictLabel"
                  :value="dict.dictValue"
                />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="处方类型" prop="prescriptionType">
              <el-select
                v-model="form.prescriptionType"
                style="width:240px"
                placeholder="处方类型"
                size="small"
              >
                <el-option
                  v-for="dict in prescriptionTypeOptions"
                  :key="dict.dictValue"
                  :label="dict.dictLabel"
                  :value="dict.dictValue"
                />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="生产厂家" prop="producerId">
              <el-select
                v-model="form.producerId"
                style="width:240px"
                placeholder="生产厂家"
                size="small"
              >
                <el-option
                  v-for="d in producerOptions"
                  :key="d.producerId"
                  :label="d.producerName"
                  :value="d.producerId"
                />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="handleSubmit">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </span>
    </el-dialog>
    <!-- 添加修改弹出层结束 -->

  </div>
</template>
<script>
// 引入api
import { selectAllProducer } from '@/api/erp/producer'
import { listMedicinesForPage, addMedicines, updateMedicines, getMedicinesById, deleteMedicinesByIds, updateMedicinesStorage } from '@/api/erp/medicines'
export default {
  // 定义页面数据
  data() {
    return {
      // 是否启用遮罩层
      loading: false,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 分页数据总条数
      total: 0,
      // 字典表格数据
      medicinesTableList: [],
      // 弹出层标题
      title: '',
      // 是否显示弹出层
      open: false,
      // 状态数据字典
      statusOptions: [],
      // 药品类型数据字典
      medicinesTypeOptions: [],
      // 生产厂家数据
      producerOptions: [],
      // 处方类型数字典
      prescriptionTypeOptions: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        medicinesName: undefined,
        medicinesType: undefined,
        prescriptionType: undefined,
        producerId: undefined,
        status: undefined,
        keywords: undefined
      },
      // 表单数据
      form: {},
      // 表单校验
      rules: {
        medicinesName: [
          { required: true, message: '药品名称不能为空', trigger: 'blur' }
        ],
        keywords: [
          { required: true, message: '查询关键字不能为空', trigger: 'blur' }
        ],
        prescriptionPrice: [
          { required: true, message: '处方价格不能为空', trigger: 'blur' }
        ],
        medicinesStockDangerNum: [
          { required: true, message: '预警值不能为空', trigger: 'blur' }
        ],
        medicinesType: [
          { required: true, message: '药品类型不能为空', trigger: 'blur' }
        ],
        prescriptionType: [
          { required: true, message: '处方类型不能为空', trigger: 'blur' }
        ],
        producerId: [
          { required: true, message: '生产厂家不能为空', trigger: 'blur' }
        ]
      }
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
    // 查询表格数据
    getMedicinesList() {
      this.loading = true // 打开遮罩
      listMedicinesForPage(this.queryParams).then(res => {
        this.medicinesTableList = res.data
        this.total = res.total
        this.loading = false// 关闭遮罩
      })
    },
    // 条件查询
    handleQuery() {
      this.getMedicinesList()
    },
    // 重置查询条件
    resetQuery() {
      this.resetForm('queryForm')
      this.dateRange = []
      this.getMedicinesList()
    },
    // 数据表格的多选择框选择时触发
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.medicinesId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
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
    },
    // 打开添加的弹出层
    handleAdd() {
      this.open = true
      this.reset()
      this.title = '添加生产药品信息'
    },
    // 打开修改的弹出层
    handleUpdate(row) {
      this.title = '修改生产药品信息'
      const medicinesId = row.medicinesId || this.ids
      this.open = true
      this.reset()
      // 根据dictId查询一个字典信息
      this.loading = true
      getMedicinesById(medicinesId).then(res => {
        this.form = res.data
        // 因为后台给的是string类型，而前端比较是使用int
        this.form.producerId = parseInt(res.data.producerId)
        this.loading = false
      })
    },
    // 执行删除
    handleDelete(row) {
      const medicinesIds = row.medicinesId || this.ids
      const tx = this
      tx.$confirm('此操作将永久删除该生产药品数据, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        tx.loading = true
        deleteMedicinesByIds(medicinesIds).then(res => {
          tx.loading = false
          tx.msgSuccess('删除成功')
          tx.getMedicinesList()// 全查询
        }).catch(() => {
          tx.msgError('删除失败')
          tx.loading = false
        })
      }).catch(() => {
        tx.msgError('删除已取消')
        tx.loading = false
      })
    },
    // 保存
    handleSubmit() {
      this.$refs['form'].validate((valid) => {
        if (valid) {
          // 做添加
          this.loading = true
          const tx = this
          if (tx.form.medicinesId === undefined) {
            addMedicines(tx.form).then(res => {
              tx.msgSuccess('保存成功')
              tx.loading = false
              tx.getMedicinesList()// 列表重新查询
              tx.open = false// 关闭弹出层
            }).catch(() => {
              tx.loading = false
            })
          } else { // 做修改
            updateMedicines(tx.form).then(res => {
              tx.msgSuccess('修改成功')
              tx.loading = false
              tx.getMedicinesList()// 列表重新查询
              tx.open = false// 关闭弹出层
            }).catch(() => {
              tx.loading = false
            })
          }
        }
      })
    },
    // 取消
    cancel() {
      this.open = false
      this.title = ''
    },
    // 重置表单
    reset() {
      this.resetForm('form')
      this.form = {
        medicinesId: undefined,
        medicinesName: undefined,
        medicinesNumber: undefined,
        unit: undefined,
        conversion: undefined,
        prescriptionPrice: 0,
        medicinesStockDangerNum: 0,
        medicinesType: undefined,
        prescriptionType: undefined,
        keywords: undefined,
        medicinesStockNum: 0,
        status: '0'
      }
    },
    // 调整库存
    handleUpdateStorage(row) {
      const tx = this
      tx.$prompt('请输入要调整[' + row.medicinesName + ']的值', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        inputPattern: /^-?\d+$/,
        inputErrorMessage: '库存值输入不正确'
      }).then(({ value }) => {
        updateMedicinesStorage(row.medicinesId, value).then(res => {
          tx.msgSuccess('调整成功')
          tx.getMedicinesList()// 重新查询数据
        }).catch(() => {
          tx.msgError('调整失败')
        })
      }).catch(() => {
        tx.msgError('调整取消')
      })
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
