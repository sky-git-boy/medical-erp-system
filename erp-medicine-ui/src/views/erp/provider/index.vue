<template>
  <div class="app-container">
    <!-- 查询条件开始 -->
    <el-form ref="queryForm" :model="queryParams" :inline="true" label-width="98px">
      <el-form-item label="供应商名称" prop="providerName">
        <el-input
          v-model="queryParams.providerName"
          placeholder="请输入供应商名称"
          clearable
          size="small"
          style="width:180px"
        />
      </el-form-item>
      <el-form-item label="联系人" prop="contactName">
        <el-input
          v-model="queryParams.contactName"
          placeholder="请输入联系人"
          clearable
          size="small"
          style="width:180px"
        />
      </el-form-item>
      <el-form-item label="供应商电话" prop="contactTel">
        <el-input
          v-model="queryParams.contactTel"
          placeholder="请输入供应商电话"
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
    <el-table v-loading="loading" border :data="providerTableList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="供应商ID" align="center" prop="providerId" />
      <el-table-column label="供应商名称" width="150" prop="providerName" />
      <el-table-column label="联系人" align="center" prop="contactName" />
      <el-table-column label="联系人手机" width="100" align="center" prop="contactMobile" />
      <el-table-column label="联系人电话" align="center" prop="contactTel" />
      <el-table-column label="银行账号" width="200" align="center" prop="bankAccount" />
      <el-table-column label="供应商地址" align="center" prop="providerAddress" />
      <el-table-column label="状态" prop="status" align="center" :formatter="statusFormatter" />
      <el-table-column label="创建时间" width="180" align="center" prop="createTime" />
      <el-table-column label="操作" align="center">
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
        <el-form-item el-form-item label="供应商名称" prop="providerName">
          <el-input v-model="form.providerName" placeholder="请输入供应商名称" clearable size="small" />
        </el-form-item>
        <el-form-item label="联系人" prop="contactName">
          <el-input v-model="form.contactName" placeholder="请输入联系人" clearable size="small" />
        </el-form-item>
        <el-form-item label="手机" prop="contactMobile">
          <el-input v-model="form.contactMobile" placeholder="请输入手机" clearable size="small" />
        </el-form-item>
        <el-form-item label="电话" prop="contactTel">
          <el-input v-model="form.contactTel" placeholder="请输入电话" clearable size="small" />
        </el-form-item>
        <el-form-item label="银行账号" prop="bankAccount">
          <el-input v-model="form.bankAccount" placeholder="请输入银行账号" clearable size="small" />
        </el-form-item>
        <el-form-item label="地址" prop="providerAddress">
          <el-input v-model="form.providerAddress" placeholder="请输入地址" clearable size="small" />
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
import { listProviderForPage, addProvider, updateProvider, getProviderById, deleteProviderByIds } from '@/api/erp/provider'
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
      providerTableList: [],
      // 弹出层标题
      title: '',
      // 是否显示弹出层
      open: false,
      // 状态数据字典
      statusOptions: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        providerName: undefined,
        contactName: undefined,
        contactTel: undefined,
        status: undefined
      },
      // 表单数据
      form: {},
      // 表单校验
      rules: {
        providerName: [
          { required: true, message: '供应商名称不能为空', trigger: 'blur' }
        ],
        contactName: [
          { required: true, message: '联系人不能为空', trigger: 'blur' }
        ],
        contactMobile: [
          { required: true, message: '手机不能为空', trigger: 'blur' },
          { pattern: /^1[3|4|5|7|8|9][0-9]\d{8}$/, message: '请输入正确的手机号', trigger: 'blur' }
        ],
        bankAccount: [
          { required: true, message: '银行账号不能为空', trigger: 'blur' }
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
    this.getProviderList()
  },
  // 方法
  methods: {
    // 查询表格数据
    getProviderList() {
      this.loading = true // 打开遮罩
      listProviderForPage(this.queryParams).then(res => {
        this.providerTableList = res.data
        this.total = res.total
        this.loading = false// 关闭遮罩
      })
    },
    // 条件查询
    handleQuery() {
      this.getProviderList()
    },
    // 重置查询条件
    resetQuery() {
      this.resetForm('queryForm')
      this.dateRange = []
      this.getProviderList()
    },
    // 数据表格的多选择框选择时触发
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.providerId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    // 分页pageSize变化时触发
    handleSizeChange(val) {
      this.queryParams.pageSize = val
      // 重新查询
      this.getProviderList()
    },
    // 点击上一页  下一页，跳转到哪一页面时触发
    handleCurrentChange(val) {
      this.queryParams.pageNum = val
      // 重新查询
      this.getProviderList()
    },
    // 翻译状态
    statusFormatter(row) {
      return this.selectDictLabel(this.statusOptions, row.status)
    },
    // 打开添加的弹出层
    handleAdd() {
      this.open = true
      this.reset()
      this.title = '添加生产供应商信息'
    },
    // 打开修改的弹出层
    handleUpdate(row) {
      this.title = '修改生产供应商信息'
      const providerId = row.providerId || this.ids
      this.open = true
      this.reset()
      // 根据dictId查询一个字典信息
      this.loading = true
      getProviderById(providerId).then(res => {
        this.form = res.data
        this.loading = false
      })
    },
    // 执行删除
    handleDelete(row) {
      const providerIds = row.providerId || this.ids
      const tx = this
      tx.$confirm('此操作将永久删除该生产供应商数据, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        tx.loading = true
        deleteProviderByIds(providerIds).then(res => {
          tx.loading = false
          tx.msgSuccess('删除成功')
          tx.getProviderList()// 全查询
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
          if (tx.form.providerId === undefined) {
            addProvider(tx.form).then(res => {
              tx.msgSuccess('保存成功')
              tx.loading = false
              tx.getProviderList()// 列表重新查询
              tx.open = false// 关闭弹出层
            }).catch(() => {
              tx.loading = false
            })
          } else { // 做修改
            updateProvider(tx.form).then(res => {
              tx.msgSuccess('修改成功')
              tx.loading = false
              tx.getProviderList()// 列表重新查询
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
        providerId: undefined,
        providerName: undefined,
        contactName: undefined,
        contactMobile: undefined,
        contactTel: undefined,
        bankAccount: undefined,
        providerAddress: undefined,
        status: '0'
      }
    }
  }
}
</script>
