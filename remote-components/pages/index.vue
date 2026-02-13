<template>
    <div class="container">
        <h1>🏝️ Remote Components Server</h1>
        <p class="subtitle">This server exposes components as Islands that can be consumed remotely</p>

        <div class="info-box">
            <h3>📡 Available components:</h3>
            <ul>
                <li>
                    <code>UserProfile</code>
                    - Props: userId (string)
                </li>
                <li>
                    <code>Analytics</code>
                    - Props: dateRange (string)
                </li>
                <li>
                    <code>Notifications</code>
                    - Props: limit (number)
                </li>
            </ul>

            <h3>🔗 How to consume:</h3>
            <pre><code>&lt;NuxtIsland 
  name="UserProfile"
  source="http://localhost:3001"
  :props="{ userId: '123' }"
/&gt;</code></pre>
        </div>

        <h2>Components Preview</h2>

        <div class="preview-grid">
            <UserProfile userId="42" />
            <Analytics dateRange="7d" />
            <Notifications :limit="3" />
        </div>

        <div class="status">
            <p>✅ Server running on port 3001</p>
            <p>
                🌐 Islands endpoint:
                <code>/__nuxt_island/*</code>
            </p>
        </div>
    </div>
</template>

<style scoped>
.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 40px 20px;
}

h1 {
    font-size: 36px;
    margin-bottom: 10px;
    color: #2c3e50;
}

.subtitle {
    font-size: 18px;
    color: #7f8c8d;
    margin-bottom: 30px;
}

.info-box {
    background: #f8f9fa;
    border: 2px solid #e9ecef;
    border-radius: 8px;
    padding: 20px;
    margin-bottom: 30px;
}

.info-box h3 {
    margin-top: 0;
    color: #495057;
}

.info-box ul {
    list-style: none;
    padding: 0;
}

.info-box li {
    padding: 8px 0;
    border-bottom: 1px solid #dee2e6;
}

.info-box li:last-child {
    border-bottom: none;
}

code {
    background: #e9ecef;
    padding: 2px 6px;
    border-radius: 4px;
    font-family: 'Courier New', monospace;
    font-size: 14px;
}

pre {
    background: #2c3e50;
    color: #ecf0f1;
    padding: 15px;
    border-radius: 6px;
    overflow-x: auto;
}

pre code {
    background: transparent;
    color: inherit;
}

h2 {
    font-size: 28px;
    margin: 40px 0 20px 0;
    color: #2c3e50;
}

.preview-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 20px;
    margin-bottom: 40px;
}

.status {
    background: #d4edda;
    border: 1px solid #c3e6cb;
    border-radius: 6px;
    padding: 15px;
    text-align: center;
}

.status p {
    margin: 5px 0;
    color: #155724;
}
</style>
