#!/bin/bash

# 🏝️ Nuxt Islands - Setup Script
# This script makes it easier to install and run the project

set -e

echo "🏝️  Nuxt Islands - Functional Example"
echo "===================================="
echo ""

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored messages
print_step() {
    echo -e "${BLUE}▶${NC} $1"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

# Check if Node.js is installed
print_step "Checking Node.js..."
if ! command -v node &> /dev/null; then
    echo "❌ Node.js not found. Please install Node.js 18+ first."
    exit 1
fi

NODE_VERSION=$(node -v)
print_success "Node.js $NODE_VERSION found"
echo ""

# Script options
echo "Choose an option:"
echo "1) Install dependencies in both projects"
echo "2) Start servers (dev mode)"
echo "3) Build for production"
echo "4) Install + Start"
echo ""
read -p "Option [1-4]: " option

case $option in
    1)
        # Install dependencies
        print_step "Installing remote-components dependencies..."
        cd remote-components
        npm install
        cd ..
        print_success "Remote components: dependencies installed"
        echo ""
        
        print_step "Installing main-app dependencies..."
        cd main-app
        npm install
        cd ..
        print_success "Main app: dependencies installed"
        echo ""
        
        print_success "All dependencies installed successfully!"
        echo ""
        echo "Run './setup.sh' and choose option 2 to start the servers"
        ;;
        
    2)
        # Start servers
        print_warning "IMPORTANT: Open 2 separate terminals"
        echo ""
        echo "Terminal 1 - Run:"
        echo "  cd remote-components && npm run dev"
        echo ""
        echo "Terminal 2 - Run (after Terminal 1 is running):"
        echo "  cd main-app && npm run dev"
        echo ""
        echo "Then access:"
        echo "  Main App: http://localhost:3000"
        echo "  Remote Components: http://localhost:3001"
        ;;
        
    3)
        # Production build
        print_step "Building remote-components..."
        cd remote-components
        npm run build
        cd ..
        print_success "Remote components: build complete"
        echo ""
        
        print_step "Building main-app..."
        cd main-app
        npm run build
        cd ..
        print_success "Main app: build complete"
        echo ""
        
        print_success "Builds completed!"
        echo ""
        echo "To test in production mode:"
        echo "Terminal 1: cd remote-components && npm run preview"
        echo "Terminal 2: cd main-app && npm run preview"
        ;;
        
    4)
        # Install and start
        print_step "Installing dependencies..."
        
        cd remote-components
        npm install
        cd ..
        print_success "Remote components installed"
        
        cd main-app
        npm install
        cd ..
        print_success "Main app installed"
        echo ""
        
        print_step "Starting servers..."
        print_warning "IMPORTANT: Starting in background"
        echo ""
        
        # Start remote-components in background
        cd remote-components
        npm run dev > ../remote-components.log 2>&1 &
        REMOTE_PID=$!
        cd ..
        
        echo "Waiting for remote-components to start (5s)..."
        sleep 5
        
        # Start main-app in background
        cd main-app
        npm run dev > ../main-app.log 2>&1 &
        MAIN_PID=$!
        cd ..
        
        echo ""
        print_success "Servers started!"
        echo ""
        echo "PIDs:"
        echo "  Remote Components: $REMOTE_PID"
        echo "  Main App: $MAIN_PID"
        echo ""
        echo "URLs:"
        echo "  Main App: http://localhost:3000"
        echo "  Remote Components: http://localhost:3001"
        echo ""
        echo "Logs:"
        echo "  Remote: tail -f remote-components.log"
        echo "  Main: tail -f main-app.log"
        echo ""
        echo "To stop the servers:"
        echo "  kill $REMOTE_PID $MAIN_PID"
        ;;
        
    *)
        echo "❌ Invalid option"
        exit 1
        ;;
esac
