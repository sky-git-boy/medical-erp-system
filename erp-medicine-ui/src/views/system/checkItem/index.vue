<template>
  <div class="app-container">

    <!-- 查询条件开始 -->
    <el-form ref="queryForm" :model="queryParams" :inline="true">
      <el-form-item label="检查项目名称" prop="checkItemName">
        <el-input
          v-model="queryParams.checkItemName"
          placeholder="请输入检查项目名称"
          clearable
          size="small"
          style="width:200px"
        />
      </el-form-item>
      <el-form-item label="关键字" prop="keywords">
        <el-input
          v-model="queryParams.keywords"
          placeholder="请输入关键字"
          clearable
          size="small"
          style="width:200px"
        />
      </el-form-item>
      <el-form-item label="项目类型" prop="typeId">
        <el-select
          v-model="queryParams.typeId"
          placeholder="项目类型"
          clearable
          size="small"
          style="width:200px"
        >
          <el-option
            v-for="dict in typeOptions"
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
          style="width:200px"
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

    <!-- 表头控件开始 -->
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
    <!-- 表头控件结束 -->

    <!-- 数据表格开始 -->
    <el-table v-loading="loading" border :data="checkItemTableList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="检查项目ID" align="center" prop="checkItemId" />
      <el-table-column label="检查项目名称" align="center" prop="checkItemName" />
      <el-table-column label="关键字" align="center" prop="keywords" />
      <el-table-column label="项目单价" align="center" prop="unitPrice" />
      <el-table-column label="项目成本" align="center" prop="cost" />
      <el-table-column label="单位" align="center" prop="unit" />
      <el-table-column label="项目类别" prop="typeId" align="center" :formatter="typeFormatter" />
      <el-table-column label="状态" prop="status" align="center" :formatter="statusFormatter" />
      <el-table-column label="创建时间" width="160" align="center" prop="createTime" />
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
        <el-form-item label="项目类型" prop="typeId">
          <el-radio-group v-model="form.typeId">
            <el-radio
              v-for="dict in typeOptions"
              :key="dict.dictValue"
              :label="dict.dictValue"
              :value="dict.dictValue"
            >{{ dict.dictLabel }}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="检查项目名称" prop="checkItemName">
          <el-input v-model="form.checkItemName" placeholder="请输入检查项目名称" clearable size="small" />
        </el-form-item>
        <el-form-item label="关键字" prop="keywords">
          <el-input v-model="form.keywords" placeholder="请输入关键字" clearable size="small" />
        </el-form-item>
        <el-form-item label="检查项目价格" prop="unitPrice">
          <el-input-number v-model="form.unitPrice" placeholder="请输入检查项目价格" clearable size="small" />
        </el-form-item>
        <el-form-item label="检查项目成本" prop="cost">
          <el-input-number v-model="form.cost" placeholder="请输入检查项目成本" clearable size="small" />
        </el-form-item>
        <el-form-item label="单位" prop="unit">
          <el-input v-model="form.unit" placeholder="请输入项目单位" clearable size="small" />
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
import { listCheckItemForPage, addCheckItem, updateCheckItem, deleteCheckItemByIds, getCheckItemById } from '@/api/system/checkItem'
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
      checkItemTableList: [],
      // 弹出层标题
      title: '',
      // 是否显示弹出层
      open: false,
      // 状态数据字典
      statusOptions: [],
      // 类型数据字典
      typeOptions: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        checkItemName: undefined,
        keywords: undefined,
        typeId: undefined,
        status: undefined
      },
      // 表单数据
      form: {},
      // 表单校验
      rules: {
        checkItemName: [
          { required: true, message: '检查项目名称不能为空', trigger: 'blur' }
        ],
        keywords: [
          { required: true, message: '检查项目关键字不能为空', trigger: 'blur' }
        ],
        unitPrice: [
          { required: true, message: '检查项目单价不能为空', trigger: 'blur' }
        ],
        cost: [
          { required: true, message: '检查项目成本不能为空', trigger: 'blur' }
        ],
        unit: [
          { required: true, message: '检查项目单位不能为空', trigger: 'blur' }
        ]
      }
    }
  },
  // 钩子
  created() {
    // 使用全局的根据字典类型查询字典数据的方法查询字典数据
    this.getDataByType('sys_normal_disable').then(res => {
      this.statusOptions = res.data
    })
    // 使用全局的根据字典类型查询字典数据的方法查询字典数据
    this.getDataByType('his_inspection_type').then(res => {
      this.typeOptions = res.data
    })
    // 查询表格数据
    this.getCheckItemList()
  },
  // 自定义方法
  methods: {
    // 查询表格数据
    getCheckItemList() {
      this.loading = true
      listCheckItemForPage(this.queryParams).then(res => {
        this.checkItemTableList = res.data
        this.total = res.total
        this.loading = false
      })
    },
    // 条件查询
    handleQuery() {
      this.getCheckItemList()
    },
    // 重置查询条件
    resetQuery() {
      this.resetForm('queryForm')
      this.getCheckItemList()
    },
    // 打开添加遮罩层
    handleAdd() {
      this.open = true
      this.reset()
      this.title = '添加检查项目信息'
    },
    // 打开修改遮罩层
    handleUpdate(row) {
      this.title = '修改检查项目信息'
      const checkItemId = row.checkItemId || this.ids
      this.open = true
      this.reset()
      // 根据dictId查询一个字典信息
      this.loading = true
      getCheckItemById(checkItemId).then(res => {
        this.form = res.data
        this.loading = false
      })
    },
    // 执行删除
    handleDelete(row) {
      const checkItemId = row.checkItemId || this.ids
      const tx = this
      tx.$confirm('此操作将永久删除该检查项目数据，是否继续', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        tx.loading = true
        deleteCheckItemByIds(checkItemId).then(res => {
          tx.loading = false
          tx.msgSuccess('删除成功')
          tx.getCheckItemList()// 全查询
        }).catch(() => {
          tx.msgError('删除失败')
          tx.loading = false
        })
      }).catch(() => {
        tx.msgError('删除已取消')
        tx.loading = false
      })
    },
    // 数据表格的多选框选择时触发
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.checkItemId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    // 项目类型翻译
    typeFormatter(row) {
      return this.selectDictLabel(this.typeOptions, row.typeId)
    },
    // 状态翻译
    statusFormatter(row) {
      return this.selectDictLabel(this.statusOptions, row.status)
    },
    // 分页pageSize变化时触发
    handleSizeChange(val) {
      this.queryParams.pageSize = val
      // 重新查询
      this.getCheckItemList()
    },
    // 点击上一页 下一页。跳转到哪一页面时触发
    handleCurrentChange(val) {
      this.queryParams.pageNum = val
      // 重新查询
      this.getCheckItemList()
    },
    // 提交
    handleSubmit() {
      this.$refs['form'].validate((valid) => {
        if (valid) {
          // 做添加
          this.loading = true
          const tx = this
          if (tx.form.checkItemId === undefined) {
            addCheckItem(tx.form).then(res => {
              tx.msgSuccess('保存成功')
              tx.loading = false
              tx.getCheckItemList()// 列表重新查询
              tx.open = false// 关闭弹出层
            }).catch(() => {
              tx.loading = false
            })
          } else {
            // 做修改
            updateCheckItem(tx.form).then(res => {
              tx.msgSuccess('修改成功')
              tx.loading = false
              tx.getCheckItemList()// 列表重新查询
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
    reset() {
      this.resetForm('form')
      this.form = {
        checkItemId: undefined,
        checkItemName: undefined,
        keywords: undefined,
        unitPrice: 0,
        cost: 0,
        unit: undefined,
        typeId: '1',
        status: '0'
      }
    }
  }
}
</script>
