# Subscription Manager - 订阅管理工具

帮助个人用户统一管理各类在线服务订阅，记录费用、到期时间，统计分析支出。

## 快速开始

### 环境要求

- Node.js >= 18
- npm >= 9

### 安装与运行

```bash
cd subscription-manager
npm install
npm run dev
```

## 功能特性

- **仪表盘**：活跃订阅总数、月度/年度支出、即将续费提醒、类型分布
- **订阅管理**：新增、编辑、删除、查看订阅项目，支持状态变更
- **筛选排序**：按类型/状态/周期/币种筛选，按时间/费用/名称排序，关键字搜索
- **统计分析**：类型分布饼图、状态分布、计费周期分布、TOP 支出排行、续费时间轴
- **设置**：默认币种、年付摊销、预算管理、分类管理
- **导入导出**：JSON 备份与恢复、CSV 导出
- **数据持久化**：使用 localStorage 本地存储，无需后端
- **响应式设计**：适配桌面端和移动端
- **深色主题**：默认深色模式，视觉效果专业

## 目录结构

```
subscription-manager/
├── src/
│   ├── components/
│   │   ├── ui/           # shadcn/ui 基础组件
│   │   └── layout/       # 布局组件 (Sidebar, MainLayout)
│   ├── pages/            # 页面组件
│   │   ├── Dashboard.tsx      # 仪表盘
│   │   ├── Subscriptions.tsx  # 订阅列表
│   │   ├── SubscriptionForm.tsx  # 新增/编辑
│   │   ├── SubscriptionDetail.tsx # 订阅详情
│   │   ├── Statistics.tsx     # 统计分析
│   │   └── Settings.tsx       # 设置
│   ├── stores/           # Zustand 状态管理
│   ├── types/            # TypeScript 类型定义
│   ├── utils/            # 工具函数
│   └── App.tsx           # 路由配置
├── public/
└── package.json
```

## 技术栈

- React 18 + TypeScript
- Vite 6
- Tailwind CSS 3
- shadcn/ui (Radix UI)
- Zustand (状态管理 + localStorage 持久化)
- React Router v7
- Recharts (图表)
- Lucide React (图标)
- date-fns (日期处理)