import Vue from 'vue'
import Router from 'vue-router'
Vue.use(Router)

/* Layout */
import Layout from '@/layout'
/**
 * constantRoutes 常量路由，这些路由由后台的数据控制是否显示
 */
export const constantRoutes = [
  {
    path: '/redirect',
    component: Layout,
    hidden: true,
    children: [
      {
        path: '/redirect/:path*',
        component: () => import('@/views/redirect/index')
      }
    ]
  },
  {
    path: '/login',
    component: () => import('@/views/login/index'),
    hidden: true
  },
  {
    path: '/auth-redirect',
    component: () => import('@/views/login/auth-redirect'),
    hidden: true
  },
  {
    path: '/404',
    component: () => import('@/views/error-page/404'),
    hidden: true
  },
  {
    path: '/401',
    component: () => import('@/views/error-page/401'),
    hidden: true
  },
  {
    path: '/',
    component: Layout,
    redirect: '/dashboard',
    children: [
      {
        path: 'dashboard',
        component: () => import('@/views/dashboard/index'),
        name: '首页',
        meta: { title: '首页', icon: 'dashboard', affix: true }
      }
    ]
  },
  {
    path: '/profile',
    component: Layout,
    redirect: '/profile/index',
    hidden: true,
    children: [
      {
        path: 'index',
        component: () => import('@/views/profile/index'),
        name: 'Profile',
        meta: { title: '个人信息', icon: 'user', noCache: true }
      }
    ]
  }
]
// 异步路由
export const asyncRoutes = [
  {
    path: '/system',
    component: Layout,
    redirect: 'noRedirect',
    alwaysShow: true,
    name: '/system',
    meta: {
      title: '系统管理',
      icon: 'lock'
    },
    children: [
      {
        path: 'dept',
        component: () => import('@/views/error-page/404'),
        name: '/system/dept',
        meta: {
          title: '科室管理',
          icon: 'edit'
        }
      },
      {
        path: 'user',
        component: () => import('@/views/error-page/404'),
        name: '/system/user',
        meta: {
          title: '用户管理',
          icon: 'list'
        }
      },
      {
        path: 'role',
        component: () => import('@/views/error-page/404'),
        name: '/system/role',
        meta: {
          title: '角色管理',
          icon: 'tab'
        }
      },
      {
        path: 'menu',
        component: () => import('@/views/error-page/404'),
        name: '/system/menu',
        meta: {
          title: '菜单管理',
          icon: 'bug'
        }
      },
      {
        path: 'dict',
        component: () => import('@/views/system/dict/type'),
        name: '/system/dict',
        meta: {
          title: '字典管理',
          icon: 'zip'
        }
      },
      {
        path: 'notice',
        component: () => import('@/views/error-page/404'),
        name: '/system/notice',
        meta: {
          title: '通知公告',
          icon: 'theme'
        }
      },
      {
        path: 'log_login',
        component: () => import('@/views/system/loginInfo/index'),
        name: '/system/log_login',
        meta: {
          title: '登陆日志管理',
          icon: 'clipboard'
        }
      },
      {
        path: 'log_opt',
        component: () => import('@/views/system/operLog/index'),
        name: '/system/log_opt',
        meta: {
          title: '操作日志管理',
          icon: 'clipboard'
        }
      }
    ]
  },
  {
    path: '/statistics',
    component: Layout,
    redirect: 'noRedirect',
    name: '/statistics',
    meta: {
      title: '数据统计',
      icon: 'example'
    },
    children: [
      {
        path: 'revenue',
        component: () => import('@/views/error-page/404'),
        name: '/statistics/revenue',
        meta: { title: '收支统计', icon: 'edit' }
      },
      {
        path: 'sales',
        component: () => import('@/views/error-page/404'),
        name: '/statistics/sales',
        meta: { title: '药品销售统计', icon: 'list' },
        hidden: true
      },
      {
        path: 'check',
        component: () => import('@/views/error-page/404'),
        name: '/statistics/check',
        meta: { title: '检查项目统计', icon: 'list' }
      },
      {
        path: 'workload',
        component: () => import('@/views/error-page/404'),
        name: '/statistics/workload',
        meta: { title: '工作量统计', icon: 'list' }
      }
    ]
  },
  {
    path: '/stock',
    component: Layout,
    redirect: 'noRedirect',
    name: '/stock',
    meta: {
      title: '药品进销存',
      icon: 'star'
    },
    children: [
      {
        path: 'producter',
        component: () => import('@/views/error-page/404'),
        name: '/stock/producter',
        meta: { title: '生产厂家维护', icon: 'list' }
      },
      {
        path: 'medicinal',
        component: () => import('@/views/error-page/404'),
        name: '/stock/medicinal',
        meta: { title: '药品信息维护', icon: 'list' }
      },
      {
        path: 'provider',
        component: () => import('@/views/error-page/404'),
        name: '/stock/provider',
        meta: { title: '供应商维护', icon: 'list' }
      },
      {
        path: 'purchase',
        component: () => import('@/views/error-page/404'),
        name: '/stock/purchase',
        meta: { title: '采购入库列表', icon: 'list' }
      },
      {
        path: 'examine',
        component: () => import('@/views/error-page/404'),
        name: '/stock/examine',
        meta: { title: '入库审核', icon: 'list' }
      },
      {
        path: 'inventory',
        component: () => import('@/views/error-page/404'),
        name: '/stock/inventory',
        meta: { title: '库存查询', icon: 'list' }
      }
    ]
  },
  {
    path: '/charge',
    component: Layout,
    redirect: 'noRedirect',
    name: '/charge',
    meta: {
      title: '收费管理',
      icon: 'excel'
    },
    children: [
      {
        path: 'charge',
        component: () => import('@/views/error-page/404'),
        name: '/charge/docharge',
        meta: { title: '处方收费', icon: 'list' }
      },
      {
        path: 'chargelist',
        component: () => import('@/views/error-page/404'),
        name: '/charge/chargelist',
        meta: { title: '收费查询', icon: 'list' }
      },
      {
        path: 'backfee',
        component: () => import('@/views/error-page/404'),
        name: '/charge/backfee',
        meta: { title: '处方退费', icon: 'list' }
      },
      {
        path: 'backfeelist',
        component: () => import('@/views/error-page/404'),
        name: '/charge/backfeelist',
        meta: { title: '退费查询', icon: 'list' }
      },
      {
        path: 'dispensing',
        component: () => import('@/views/error-page/404'),
        name: '/charge/dispensing',
        meta: { title: '处方发药', icon: 'list' }
      }
    ]
  },
  {
    path: '/check',
    component: Layout,
    redirect: 'noRedirect',
    name: '/check',
    meta: {
      title: '检查管理',
      icon: 'excel'
    },
    children: [
      {
        path: 'docheck',
        component: () => import('@/views/error-page/404'),
        name: '/check/docheck',
        meta: { title: '新开检查', icon: 'list' }
      },
      {
        path: 'checkresult',
        component: () => import('@/views/error-page/404'),
        name: '/check/checkresult',
        meta: { title: '检查结果录入', icon: 'list' }
      },
      {
        path: 'checklist',
        component: () => import('@/views/error-page/404'),
        name: '/check/checklist',
        meta: { title: '检查结果查询', icon: 'list' }
      }
    ]
  },
  {
    path: '/doctor',
    component: Layout,
    redirect: 'noRedirect',
    name: '/doctor',
    meta: {
      title: '看病就诊',
      icon: 'excel'
    },
    children: [
      {
        path: 'registered',
        component: () => import('@/views/error-page/404'),
        name: '/doctor/registered',
        meta: { title: '门诊挂号', icon: 'list' }
      },
      {
        path: 'registeredlist',
        component: () => import('@/views/error-page/404'),
        name: '/doctor/registeredlist',
        meta: { title: '挂号列表', icon: 'list' }
      },
      {
        path: 'newcare',
        component: () => import('@/views/error-page/404'),
        name: '/doctor/newcare',
        meta: { title: '新开就诊', icon: 'list' }
      },
      {
        path: 'myscheduling',
        component: () => import('@/views/error-page/404'),
        name: '/doctor/myscheduling',
        meta: { title: '我的排班', icon: 'list' }
      },
      {
        path: 'scheduling',
        component: () => import('@/views/error-page/404'),
        name: '/doctor/scheduling',
        meta: { title: '医生排班', icon: 'list' }
      },
      {
        path: 'patient',
        component: () => import('@/views/error-page/404'),
        name: '/doctor/patient',
        meta: { title: '患者库', icon: 'list' }
      }
    ]
  }
]
export const lastRoute = [
  {
    path: '/dict',
    component: Layout,
    hidden: true,
    children: [
      {
        path: 'data/:dictId(\\d+)',
        component: () => import('@/views/system/dict/data'),
        name: 'data',
        meta: { title: '数据字典', icon: 'list' }
      }
    ]
  },
  {
    path: '/stock/purchase',
    component: Layout,
    hidden: true,
    children: [
      {
        path: 'insert',
        component: () => import('@/views/error-page/404'),
        name: '/stock/purchase/insert',
        meta: { title: '采购入库', icon: 'list' }
      },
      {
        path: 'update/:purchaseId',
        component: () => import('@/views/error-page/404'),
        name: '/stock/purchase/update',
        meta: { title: '采购入库修改', icon: 'list' }
      }
    ]
  },
  // 404 page must be placed at the end !!!
  { path: '*', redirect: '/404', hidden: true }
]
const createRouter = () => new Router({
  // mode: 'history', // require service support
  scrollBehavior: () => ({ y: 0 }),
  // 初始化时将所有路由都加载上，否则会出现刷新页面404的情况
  routes: constantRoutes
})
const router = createRouter()
// Detail see: https://github.com/vuejs/vue-router/issues/1234#issuecomment-357941465
export function resetRouter() {
  const newRouter = createRouter()
  router.matcher = newRouter.matcher // reset router
}
export default router
