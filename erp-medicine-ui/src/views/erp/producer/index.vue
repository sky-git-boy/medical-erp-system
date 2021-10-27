<template>
  <div class="app-container">
    <!-- 查询条件开始 -->
    <el-form ref="queryForm" :model="queryParams" :inline="true" label-width="98px">
      <el-form-item label="厂家名称" prop="producerName">
        <el-input
          v-model="queryParams.producerName"
          placeholder="请输入厂家名称"
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
      <el-form-item label="厂家电话" prop="producerTel">
        <el-input
          v-model="queryParams.producerTel"
          placeholder="请输入厂家电话"
          clearable
          size="small"
          style="width:180px"
        />
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
    <el-table v-loading="loading" border :data="producerTableList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="厂家ID" align="center" width="67" prop="producerId" />
      <el-table-column label="厂家名称" width="227" prop="producerName" />
      <el-table-column label="厂家编码" width="100" align="center" prop="producerCode" />
      <el-table-column label="联系人" align="center" prop="producerPerson" width="93" />
      <el-table-column label="电话" width="140" align="center" prop="producerTel" />
      <el-table-column label="关键字" align="center" prop="keywords" width="90" />
      <el-table-column label="状态" prop="status" align="center" :formatter="statusFormatter" width="82" />
      <el-table-column label="创建时间" width="166" align="center" prop="createTime" />
      <el-table-column label="操作" align="center" width="120">
        <template slot-scope="scope">
          <el-button type="text" icon="el-icon-edit" size="mini" @click="handleUpdate(scope.row)">修改</el-button>
          <el-button type="text" icon="el-icon-delete" size="mini" @click="handleDelete(scope.row)">删除</el-button>
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
      width="600px"
      center
      append-to-body
    >
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-form-item el-form-item label="厂家名称" prop="producerName">
          <el-input v-model="form.producerName" placeholder="请输入厂家名称" clearable size="small" />
        </el-form-item>
        <el-form-item label="厂家编码" prop="producerCode">
          <el-input v-model="form.producerCode" placeholder="请输入厂家编码" clearable size="small" />
        </el-form-item>
        <el-form-item label="联系人" prop="producerPerson">
          <el-input v-model="form.producerPerson" placeholder="请输入联系人" clearable size="small" />
        </el-form-item>
        <el-form-item label="电话" prop="producerTel">
          <el-input v-model="form.producerTel" placeholder="请输入电话" clearable size="small" />
        </el-form-item>
        <el-form-item label="关键字" prop="keywords">
          <el-input v-model="form.keywords" placeholder="请输入关键字" clearable size="small" />
        </el-form-item>
        <el-form-item label="地址" prop="producerAddress">
          <el-input v-model="form.producerAddress" placeholder="请输入地址" clearable size="small" />
        </el-form-item>
        <el-form-item label="状态" prop="status">
          <el-radio-group v-model="form.status">
            <el-radio
              v-for="dict in statusOptions"
              :key="dict.dictValue"
              :label="dict.dictValue"
              :value="dict.dictValue"
            >{{ dict.dictLabel }}</el-radio>
          </el-radio-group>
        </el-form-item>
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
import { listProducerForPage, addProducer, updateProducer, getProducerById, deleteProducerByIds } from '@/api/erp/producer'
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
      producerTableList: [],
      // 弹出层标题
      title: '',
      // 是否显示弹出层
      open: false,
      // 状态数据字典
      statusOptions: [],
      // 类型数据字典
      typeOptions: [],
      // 时间条件
      dateRange: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        producerName: undefined,
        producerCode: undefined,
        producerTel: undefined,
        status: undefined,
        keywords: undefined
      },
      // 表单数据
      form: {},
      // 表单校验
      rules: {
        producerName: [
          { required: true, message: '厂家名称不能为空', trigger: 'blur' }
        ],
        producerTel: [
          { required: true, message: '联系电话不能为空', trigger: 'blur' }
        ],
        producerPerson: [
          { required: true, message: '联系人不能为空', trigger: 'blur' }
        ],
        keywords: [
          { required: true, message: '查询关键字不能为空', trigger: 'blur' }
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
    // 查询表格数据
    this.getProducerList()
  },
  // 方法
  methods: {
    // 查询表格数据
    getProducerList() {
      this.loading = true // 打开遮罩
      listProducerForPage(this.addDateRange(this.queryParams, this.dateRange)).then(res => {
        this.producerTableList = res.data
        this.total = res.total
        this.loading = false// 关闭遮罩
      })
    },
    // 条件查询
    handleQuery() {
      this.getProducerList()
    },
    // 重置查询条件
    resetQuery() {
      this.resetForm('queryForm')
      this.dateRange = []
      this.getProducerList()
    },
    // 数据表格的多选择框选择时触发
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.producerId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    // 分页pageSize变化时触发
    handleSizeChange(val) {
      this.queryParams.pageSize = val
      // 重新查询
      this.getProducerList()
    },
    // 点击上一页  下一页，跳转到哪一页面时触发
    handleCurrentChange(val) {
      this.queryParams.pageNum = val
      // 重新查询
      this.getProducerList()
    },
    // 翻译状态
    statusFormatter(row) {
      return this.selectDictLabel(this.statusOptions, row.status)
    },
    // 打开添加的弹出层
    handleAdd() {
      this.open = true
      this.reset()
      this.title = '添加生产厂家信息'
    },
    // 打开修改的弹出层
    handleUpdate(row) {
      this.title = '修改生产厂家信息'
      const producerId = row.producerId || this.ids
      this.open = true
      this.reset()
      // 根据dictId查询一个字典信息
      this.loading = true
      getProducerById(producerId).then(res => {
        this.form = res.data
        this.loading = false
      })
    },
    // 执行删除
    handleDelete(row) {
      const producerIds = row.producerId || this.ids
      const tx = this
      tx.$confirm('此操作将永久删除该生产厂家数据, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        tx.loading = true
        deleteProducerByIds(producerIds).then(res => {
          tx.loading = false
          tx.msgSuccess('删除成功')
          tx.getProducerList()// 全查询
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
          if (tx.form.producerId === undefined) {
            addProducer(tx.form).then(res => {
              tx.msgSuccess('保存成功')
              tx.loading = false
              tx.getProducerList()// 列表重新查询
              tx.open = false// 关闭弹出层
            }).catch(() => {
              tx.loading = false
            })
          } else { // 做修改
            updateProducer(tx.form).then(res => {
              tx.msgSuccess('修改成功')
              tx.loading = false
              tx.getProducerList()// 列表重新查询
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
        producerId: undefined,
        producerName: undefined,
        producerCode: undefined,
        producerTel: undefined,
        keywords: undefined,
        status: '0'
      }
    }
  }
}
</script>
