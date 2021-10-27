/* eslint-disable */
import Vue from 'vue'
import Router from 'vue-router'
Vue.use(Router)

/* Layout */
import Layout from '@/layout'
/**
 * constantRoutes 常量路由，这些路由由后台的数据控制是否显示
 */
export const constantRoutes = [{
    path: '/redirect',
    component: Layout,
    hidden: true,
    children: [{
      path: '/redirect/:path*',
      component: () => import('@/views/redirect/index')
    }]
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
    children: [{
      path: 'dashboard',
      component: () => import('@/views/dashboard/index'),
      name: '首页',
      meta: {
        title: '首页',
        icon: 'dashboard',
        affix: true
      }
    }]
  }
]
export const asyncRoutes = [{
    path: '/system',
    component: Layout,
    redirect: 'noRedirect',
    alwaysShow: true,
    name: '/system',
    meta: {
      title: '系统管理',
      icon: 'lock'
    },
    children: [{
        path: 'dept',
        component: () => import('@/views/system/dept/index'),
        name: '/system/dept',
        meta: {
          title: '科室管理',
          icon: 'edit'
        }
      },
      {
        path: 'user',
        component: () => import('@/views/system/user/index'),
        name: '/system/user',
        meta: {
          title: '用户管理',
          icon: 'list'
        }
      },
      {
        path: 'role',
        component: () => import('@/views/system/role/index'),
        name: '/system/role',
        meta: {
          title: '角色管理',
          icon: 'tab'
        }
      },
      {
        path: 'menu',
        component: () => import('@/views/system/menu/index'),
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
        component: () => import('@/views/system/notice/index'),
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
    path: '/stock',
    component: Layout,
    redirect: 'noRedirect',
    name: '/stock',
    meta: {
      title: '药品进销存',
      icon: '404'
    },
    children: [{
        path: 'producter',
        component: () => import('@/views/erp/producer/index'),
        name: '/stock/producter',
        meta: {
          title: '生产厂家维护',
          icon: 'list'
        }
      },
      {
        path: 'medicinal',
        component: () => import('@/views/erp/medicines/index'),
        name: '/stock/medicinal',
        meta: {
          title: '药品信息维护',
          icon: 'list'
        }
      },
      {
        path: 'provider',
        component: () => import('@/views/erp/provider/index'),
        name: '/stock/provider',
        meta: {
          title: '供应商维护',
          icon: 'list'
        }
      },
      {
        path: 'purchase',
        component: () => import('@/views/erp/purchase/index'),
        name: '/stock/purchase',
        meta: {
          title: '采购入库列表',
          icon: 'list'
        }
      },
      {
        path: 'examine',
        component: () => import('@/views/erp/purchase/auditList'),
        name: '/stock/examine',
        meta: {
          title: '入库审核',
          icon: 'list'
        }
      },
      {
        path: 'inventory',
        component: () => import('@/views/erp/inventoryLog/index'),
        name: '/stock/inventory',
        meta: {
          title: '库存查询',
          icon: 'list'
        }
      }
    ]
  }
]
export const lastRoute = [{
    path: '/dict',
    component: Layout,
    hidden: true,
    children: [{
      path: 'data/:dictId(\\d+)',
      component: () => import('@/views/system/dict/data'),
      name: '/dict',
      meta: {
        title: '数据字典'
      }
    }]
  },
  {
    path: '/erp/purchase',
    component: Layout,
    hidden: true,
    children: [{
        path: 'newPurchase',
        component: () => import('@/views/erp/purchase/newPurchase'),
        name: '/erp/purchase/newPurchase',
        meta: {
          title: '新增采购',
          icon: 'list'
        }
      },
      {
        path: 'editPurchase/:purchaseId',
        component: () => import('@/views/erp/purchase/editPurchase'),
        name: '/erp/purchase/editPurchase',
        meta: {
          title: '采购入库修改',
          icon: 'list'
        }
      }
    ]
  },
  // 404 page must be placed at the end !!!
  {
    path: '*',
    redirect: '/404',
    hidden: true
  }
]
const createRouter = () => new Router({
  // mode: 'history', // require service support
  scrollBehavior: () => ({
    y: 0
  }),
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
