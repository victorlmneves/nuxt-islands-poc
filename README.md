
# 🏝️ Nuxt Islands - Functional Example

This project demonstrates how to use **Nuxt Islands** to create a micro-frontends architecture with SSR (Server-Side Rendering).

## 📁 Project Structure

```
nuxt-islands-poc/
├── remote-components/    # Remote components server (port 3001)
│   ├── components/
│   │   ├── UserProfile.island.vue      # Island: User profile
│   │   ├── Analytics.island.vue        # Island: Analytics dashboard
│   │   └── Notifications.island.vue    # Island: Notifications list
│   └── nuxt.config.ts
│
└── main-app/            # Main application that consumes the islands (port 3000)
  ├── pages/
  │   └── index.vue    # Page that consumes remote islands
  └── nuxt.config.ts
```

## 🚀 How to Run

### 1️⃣ Install Dependencies

```bash
# Terminal 1 - Remote Components
cd remote-components
npm install

# Terminal 2 - Main App
cd main-app
npm install
```

### 2️⃣ Start the Servers

**Important:** Start the remote components server first!

```bash
# Terminal 1 - Remote Components Server
cd remote-components
npm run dev
# Runs at: http://localhost:3001
```

```bash
# Terminal 2 - Main Application
cd main-app
npm run dev
# Runs at: http://localhost:3000
```

### 3️⃣ Access

- **Main App**: http://localhost:3000
- **Remote Components**: http://localhost:3001

## 🎯 What This Example Demonstrates

### ✅ Server-Side Rendering (SSR)
- Remote components are rendered on the server
- Full HTML is sent to the client
- SEO-friendly

### ✅ Independent Deployment
- `remote-components` can be updated without redeploying `main-app`
- Each project has its own lifecycle

### ✅ Isolation
- Each island hydrates independently
- Failures in one island do not affect others
- Granular cache per island

### ✅ Runtime Composition
- Components are loaded at runtime
- Props can be changed dynamically
- Independent refresh for each island

## 🔧 How It Works

### On the Remote Components Server (remote-components)

```typescript
// nuxt.config.ts
export default defineNuxtConfig({
  experimental: {
    componentIslands: true  // Enables islands
  },
  routeRules: {
    '/__nuxt_island/**': {
      cors: true  // Allows CORS for remote consumption
    }
  }
})
```

### In the Main Application (main-app)

```vue
<template>
  <!-- Consume remote island -->
  <NuxtIsland 
    name="UserProfile"                    <!-- Component name -->
    source="http://localhost:3001"        <!-- Remote server URL -->
    :props="{ userId: '42' }"             <!-- Props for the component -->
  />
</template>
```

## 🌊 Operation Flow

```
1. User accesses http://localhost:3000
  ↓
2. Nuxt (main-app) renders the page
  ↓
3. For each <NuxtIsland>:
  - Makes HTTP request to: http://localhost:3001/__nuxt_island/ComponentName
  - Passes props as query params
  ↓
4. Remote server (remote-components):
  - Renders the component on the server
  - Returns JSON with: { html, state, head }
  ↓
5. Main-app injects the HTML in SSR
  ↓
6. Client hydrates each island independently
```

## 📊 Comparison with Other Approaches

| Feature | Nuxt Islands | Module Federation | Web Components |
|---------|--------------|-------------------|----------------|
| SSR | ✅ Yes | ❌ No | ❌ No |
| Runtime Updates | ✅ Yes | ✅ Yes | ✅ Yes |
| Independent Deployment | ✅ Yes | ✅ Yes | ✅ Yes |
| Framework Agnostic | ❌ Needs Nuxt | ⚠️ Partial | ✅ Yes |
| Maturity | ⚠️ Experimental | ✅ Stable | ✅ Standard |
| Hydration | ✅ Independent | N/A | ⚠️ Manual |

## 🎨 Included Components

### 1. UserProfile
- **Props**: `userId` (string)
- **Description**: Displays user profile with avatar, stats, and status
- **Features**: Simulated data, online/offline status

### 2. Analytics
- **Props**: `dateRange` (string)
- **Description**: Dashboard with metrics and chart
- **Features**: Dynamic metrics, bar chart

### 3. Notifications
- **Props**: `limit` (number)
- **Description**: List of notifications with different types
- **Features**: Types (success, warning, error, info), timestamps

## 🔬 Try It Out

### Change Props Dynamically
In main-app, use the controls in the interface to:
- Change the `userId`
- Adjust the notification `limit`
- Select different `dateRanges`

### Test Independent Deployment
1. Modify a component in `remote-components`
2. Save the file (hot-reload active)
3. Click "Refresh Islands" in main-app
4. See the changes without restarting main-app

### Simulate Island Failure
1. Stop the `remote-components` server
2. The main-app keeps working
3. Islands show fallback/error
4. The rest of the page remains functional

## ⚠️ Current Limitations

1. **Experimental**: API may change in future Nuxt versions
2. **Performance**: Multiple HTTP requests may add latency
3. **CORS**: Needs correct configuration in production
4. **Error Handling**: Robust fallbacks must be implemented
5. **Nuxt-only**: Remote server must be Nuxt

## 🚀 Next Steps

To use in production:

1. **Cache**: Implement HTTP cache for islands
2. **CDN**: Use CDN to distribute components
3. **Monitoring**: Add observability (traces, logs)
4. **Error Boundaries**: Improve error handling
5. **Authentication**: Pass tokens/auth between apps
6. **Versioning**: Island versioning strategy

## 📚 Resources

- [Nuxt Islands Docs](https://nuxt.com/docs/api/components/nuxt-island)
- [Nuxt Component Islands RFC](https://github.com/nuxt/nuxt/discussions/19772)
- [Server Components](https://nuxt.com/docs/guide/directory-structure/components#server-components)

## 🤝 Contributions

This is an educational example. Feel free to:
- Add new components
- Improve the UI
- Implement cache
- Add tests
- Document edge cases

---

**Made with ❤️ using Nuxt Islands**
