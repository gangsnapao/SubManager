#!/bin/bash
# ============================================================
#  Subscription Manager - 一键启动脚本
#  用法: 双击运行 或 终端执行 bash start.sh
# ============================================================

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

# 颜色
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${CYAN}"
echo "  ╔══════════════════════════════════════════╗"
echo "  ║     Subscription Manager 订阅管理工具     ║"
echo "  ║              一键启动脚本                 ║"
echo "  ╚══════════════════════════════════════════╝"
echo -e "${NC}"

# 1. 检查 Node.js
if ! command -v node &> /dev/null; then
    echo -e "${RED}[错误] 未检测到 Node.js，请先安装 (https://nodejs.org)${NC}"
    read -p "按回车键退出..."
    exit 1
fi
NODE_VER=$(node -v)
echo -e "${GREEN}[✓] Node.js ${NODE_VER}${NC}"

# 2. 检查 npm
if ! command -v npm &> /dev/null; then
    echo -e "${RED}[错误] 未检测到 npm${NC}"
    read -p "按回车键退出..."
    exit 1
fi

# 3. 检查 node_modules，不存在则安装依赖
if [ ! -d "node_modules" ]; then
    echo -e "${YELLOW}[...] 首次运行，正在安装依赖...${NC}"
    npm install
    if [ $? -ne 0 ]; then
        echo -e "${RED}[错误] 依赖安装失败，请检查网络后重试${NC}"
        read -p "按回车键退出..."
        exit 1
    fi
    echo -e "${GREEN}[✓] 依赖安装完成${NC}"
else
    echo -e "${GREEN}[✓] 依赖已就绪${NC}"
fi

# 4. 自动找一个可用端口
PORT=5180
while lsof -i :"$PORT" &> /dev/null; do
    PORT=$((PORT + 1))
done

# 5. 启动开发服务器
echo -e "${CYAN}[→] 启动开发服务器...${NC}"
echo ""
echo -e "${GREEN}  ┌─────────────────────────────────────────┐"
echo -e "${GREEN}  │  本地访问:  http://localhost:${PORT}${NC}       "
echo -e "${GREEN}  │  按 Ctrl+C 停止服务器                    ${NC}  "
echo -e "${GREEN}  └─────────────────────────────────────────┘"
echo ""

npx vite --port "$PORT" --host --open
