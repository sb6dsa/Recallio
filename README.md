# Recallio

Recallio 是一个本地优先、无账号、无社交属性的个人作品记录工具，适用于记录动画、漫画、小说、游戏和电影。

设计风格为 **纸质手账风**——灰紫/旧书布纹配色、衬线标题字体、柔和微动效，打造私人备忘录式的使用体验。

## 当前阶段

当前代码处于阶段 1：本地记录闭环的可用版本，前端已完成风格化重写。

已包含：

- Flutter 应用入口，灰紫纸质手账主题（亮色/暗色双主题）。
- Playfair Display 标题字体 + Outfit 正文字体（Google Fonts）。
- go_router 页面路由，底部导航栏。
- 桌面端键盘快捷键（Ctrl+N 新建、Ctrl+F 搜索、Esc 返回等）。
- Riverpod 应用状态和数据库 Provider。
- Drift 数据库表定义和生成代码。
- 首页统计书签、作品库列表/网格双视图、类型筛选和关键词搜索。
- 首页时间线布局：最近更新以时间节点 + 左侧日期线方式展示。
- 作品库瀑布流网格：交错高度卡片，打破均匀网格的呆板感。
- 手动新建 / 编辑轻量作品记录（分区卡片式表单）。
- 作品详情查看和软删除（底部 Sheet 确认），全宽封面 Banner + 渐变过渡。
- 标题、类型、封面、评分、评价和记录日期。
- 本地封面选择并复制到应用数据目录。
- 封面 `topCenter` 对齐 + `BoxFit.cover`，评分星级由暗到亮（低分暗紫灰 → 高分亮琥珀）。
- 枚举文案、备份 manifest、评分校验、作品记录 Repository 和阶段一 UI 回归测试。
- 稳定的开发脚本，规避 Windows 下 sqlite3 native assets 下载和 MSBuild PATH 过长问题。

暂未包含：

- Bangumi 搜索导入。
- 备份包导入 / 导出。
- Android 实机体验完善。

## 配色

| 用途 | 颜色 |
|------|------|
| 主色 | `#6B5B6E` 灰紫 |
| 背景 | `#FBF6F3` 淡粉白 |
| 卡片底色 | `#FFFCF9` 暖白 |
| 深色背景 | `#1E1A1F` 深紫黑 |
| 高分色 | `#E8C856` 亮琥珀 |
| 中分色 | `#C9A87C` 暖金棕 |
| 低分色 | `#7A6E7A` 暗紫灰 |

## 第一版字段

新建 / 编辑记录页面只显示：

### 作品

- 标题，必填。
- 类型，必填：动画 / 漫画 / 小说 / 游戏。
- 封面，可选。

### 我的评价

- 评分，可选，0-10 分，支持 0.5。
- 评价，可选，多行文本。
- 记录日期，默认今天，可修改。

作品库卡片只显示封面、标题、类型、评分、评价摘要和记录日期。详情页只显示封面、标题、类型、评分、评价、记录日期，以及弱化的来源信息。

第一版 UI 不显示状态、进度、平台、标签、简介、短评、长评或剧透笔记。

## 桌面端键盘快捷键

| 快捷键 | 功能 |
|--------|------|
| `Ctrl+N` | 新建记录 |
| `Ctrl+F` | 搜索导入 |
| `Ctrl+B` | 备份与恢复 |
| `Ctrl+1` | 首页 |
| `Ctrl+2` | 作品库 |
| `Ctrl+3` | 搜索 |
| `Ctrl+4` | 备份 |
| `Ctrl+5` | 设置 |
| `Escape` | 返回 / 首页按两次退出 |

## 初始化与运行

当前工作区已安装 Flutter SDK：

```txt
E:\ppfm\tools\flutter
```

建议统一使用项目脚本运行开发命令：

```powershell
powershell.exe -ExecutionPolicy Bypass -File E:\ppfm\Recallio\scripts\recallio_dev.ps1 doctor
powershell.exe -ExecutionPolicy Bypass -File E:\ppfm\Recallio\scripts\recallio_dev.ps1 analyze
powershell.exe -ExecutionPolicy Bypass -File E:\ppfm\Recallio\scripts\recallio_dev.ps1 test
powershell.exe -ExecutionPolicy Bypass -File E:\ppfm\Recallio\scripts\recallio_dev.ps1 run-windows
```

可用任务：

```txt
clean
pub-get
analyze
test
build-windows-debug
build-windows-release
run-windows
doctor
```

脚本会设置工作区内的 `PUB_CACHE`、`TEMP`、`TMP` 和精简 `Path`，并指定 `sqlite3` 使用 Windows 系统 `winsqlite3.dll`，避免后续测试和 Windows 构建反复下载 native assets 或触发 MSBuild 环境变量过长问题。

当前 Windows Debug 构建已验证可生成：

```txt
build\windows\x64\runner\Debug\recallio.exe
```

Android SDK 命令行工具已下载到：

```txt
E:\ppfm\tools\android-sdk
```

Android 构建组件需要先接受 Android SDK License 后再安装。

## 隐私说明

Recallio 默认将数据保存在当前设备本地。除非你主动使用外部搜索功能，否则应用不会访问网络。请定期导出备份包，以便迁移设备或防止数据丢失。
