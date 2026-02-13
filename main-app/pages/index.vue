<script setup lang="ts">
const remoteSource = 'http://localhost:3001';
const userId = ref('42');
const notificationLimit = ref(3);
const dateRange = ref('7d');
const refreshKey = ref(0);

const refreshIslands = () => {
    refreshKey.value++;
};
</script>

<template>
    <div class="app-container">
        <header class="app-header">
            <h1>🚀 Main Application</h1>
            <p>Consuming remote components via Nuxt Islands</p>
        </header>

        <div class="controls">
            <h3>⚙️ Controls</h3>
            <div class="control-group">
                <label>
                    User ID:
                    <input v-model="userId" type="text" placeholder="e.g.: 42" />
                </label>
                <label>
                    Notification Limit:
                    <input v-model.number="notificationLimit" type="number" min="1" max="10" />
                </label>
                <label>
                    Date Range:
                    <select v-model="dateRange">
                        <option value="7d">7 days</option>
                        <option value="30d">30 days</option>
                        <option value="90d">90 days</option>
                    </select>
                </label>
            </div>
            <button @click="refreshIslands" class="refresh-btn">🔄 Refresh Islands</button>
        </div>

        <div class="info-banner">
            <strong>ℹ️ How it works:</strong>
            The components below are being loaded from the remote server (localhost:3001). Each island is rendered on the remote server and
            hydrated independently on the client.
        </div>

        <div class="islands-grid">
            <!-- Island 1: User Profile -->
            <div class="island-wrapper">
                <div class="island-label">
                    🏝️ Island: UserProfile
                    <span class="source">Source: localhost:3001</span>
                </div>
                <NuxtIsland name="UserProfile" :source="remoteSource" :props="{ userId }" :key="`user-${refreshKey}`" />
            </div>

            <!-- Island 2: Analytics -->
            <div class="island-wrapper">
                <div class="island-label">
                    🏝️ Island: Analytics
                    <span class="source">Source: localhost:3001</span>
                </div>
                <NuxtIsland name="Analytics" :source="remoteSource" :props="{ dateRange }" :key="`analytics-${refreshKey}`" />
            </div>

            <!-- Island 3: Notifications -->
            <div class="island-wrapper">
                <div class="island-label">
                    🏝️ Island: Notifications
                    <span class="source">Source: localhost:3001</span>
                </div>
                <NuxtIsland
                    name="Notifications"
                    :source="remoteSource"
                    :props="{ limit: notificationLimit }"
                    :key="`notif-${refreshKey}`"
                />
            </div>
        </div>

        <div class="local-content">
                <h2>📍 Main App Local Content</h2>
                <p>
                    This content is being rendered locally by the main application. The islands above are completely independent and can come from different servers.
                </p>
                <div class="features">
                    <div class="feature">
                        <span class="icon">⚡</span>
                        <h4>Independent Deployment</h4>
                        <p>Each island can be updated without redeploying the main app</p>
                    </div>
                    <div class="feature">
                        <span class="icon">🔒</span>
                        <h4>Isolation</h4>
                        <p>Failures in one island do not affect the rest of the application</p>
                    </div>
                    <div class="feature">
                        <span class="icon">🎯</span>
                        <h4>Native SSR</h4>
                        <p>Server-side rendering with independent hydration</p>
                    </div>
                    <div class="feature">
                        <span class="icon">📦</span>
                        <h4>Granular Cache</h4>
                        <p>Each island can have its own cache strategy</p>
                    </div>
                </div>
        </div>

        <footer class="app-footer">
                <p>💡 Nuxt Islands Demo - Micro-frontends with SSR</p>
                <p class="tech-stack">
                    Main App:
                    <code>localhost:3000</code>
                    | Remote Components:
                    <code>localhost:3001</code>
                </p>
        </footer>
    </div>
</template>

<style scoped>
.app-container {
    min-height: 100vh;
    background: linear-gradient(to bottom, #f7f8fa 0%, #e9ecef 100%);
    padding: 20px;
}

.app-header {
    text-align: center;
    padding: 40px 20px;
    background: white;
    border-radius: 12px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    margin-bottom: 30px;
}

.app-header h1 {
    font-size: 42px;
    margin: 0 0 10px 0;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
}

.app-header p {
    font-size: 18px;
    color: #6c757d;
    margin: 0;
}

.controls {
    background: white;
    padding: 20px;
    border-radius: 12px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    margin-bottom: 20px;
}

.controls h3 {
    margin: 0 0 15px 0;
    color: #495057;
}

.control-group {
    display: flex;
    gap: 15px;
    flex-wrap: wrap;
    margin-bottom: 15px;
}

.control-group label {
    display: flex;
    flex-direction: column;
    gap: 5px;
    font-size: 14px;
    color: #495057;
    font-weight: 500;
}

.control-group input,
.control-group select {
    padding: 8px 12px;
    border: 2px solid #dee2e6;
    border-radius: 6px;
    font-size: 14px;
    min-width: 150px;
}

.control-group input:focus,
.control-group select:focus {
    outline: none;
    border-color: #667eea;
}

.refresh-btn {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 6px;
    font-size: 14px;
    font-weight: 600;
    cursor: pointer;
    transition: transform 0.2s;
}

.refresh-btn:hover {
    transform: translateY(-2px);
}

.refresh-btn:active {
    transform: translateY(0);
}

.info-banner {
    background: #e7f3ff;
    border: 2px solid #2196f3;
    border-radius: 8px;
    padding: 15px;
    margin-bottom: 30px;
    color: #0d47a1;
    font-size: 14px;
    line-height: 1.6;
}

.islands-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
    gap: 20px;
    margin-bottom: 40px;
}

.island-wrapper {
    background: white;
    border-radius: 12px;
    padding: 15px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.island-label {
    font-size: 12px;
    font-weight: 600;
    color: #6c757d;
    margin-bottom: 10px;
    padding-bottom: 10px;
    border-bottom: 2px solid #f1f3f5;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.source {
    font-family: 'Courier New', monospace;
    font-size: 11px;
    background: #f8f9fa;
    padding: 2px 8px;
    border-radius: 4px;
    color: #495057;
}

.local-content {
    background: white;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    margin-bottom: 30px;
}

.local-content h2 {
    margin-top: 0;
    color: #2c3e50;
}

.features {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 20px;
    margin-top: 20px;
}

.feature {
    text-align: center;
    padding: 20px;
    background: #f8f9fa;
    border-radius: 8px;
}

.feature .icon {
    font-size: 32px;
    display: block;
    margin-bottom: 10px;
}

.feature h4 {
    margin: 10px 0 5px 0;
    color: #495057;
    font-size: 16px;
}

.feature p {
    margin: 0;
    font-size: 13px;
    color: #6c757d;
    line-height: 1.5;
}

.app-footer {
    text-align: center;
    padding: 20px;
    color: #6c757d;
}

.app-footer p {
    margin: 5px 0;
}

.tech-stack {
    font-size: 13px;
}

.tech-stack code {
    background: #f8f9fa;
    padding: 2px 6px;
    border-radius: 4px;
    font-family: 'Courier New', monospace;
}
</style>
