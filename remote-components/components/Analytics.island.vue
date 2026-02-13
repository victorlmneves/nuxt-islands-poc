<script setup lang="ts">
const props = defineProps({
    dateRange: {
        type: String,
        default: '7d',
    },
});

// Simulate analytics data
const metrics = ref([
    {
        name: 'Page Views',
        value: '12.5K',
        change: '+12%',
        trend: 'up',
        icon: '👁️',
    },
    {
        name: 'Users',
        value: '3.2K',
        change: '+8%',
        trend: 'up',
        icon: '👥',
    },
    {
        name: 'Bounce Rate',
        value: '42%',
        change: '-5%',
        trend: 'down',
        icon: '📉',
    },
    {
        name: 'Avg. Session',
        value: '3m 42s',
        change: '+15%',
        trend: 'up',
        icon: '⏱️',
    },
]);

// Generate chart data
const chartData = ref(Array.from({ length: 7 }, () => Math.floor(Math.random() * 80) + 20));

const updateTime = new Date().toLocaleString();
</script>

<template>
    <div class="analytics-widget">
        <h3>📊 Analytics Dashboard (Remote Component)</h3>
        <div class="metrics">
            <div class="metric" v-for="metric in metrics" :key="metric.name">
                <div class="metric-icon">{{ metric.icon }}</div>
                <div class="metric-info">
                    <span class="metric-label">{{ metric.name }}</span>
                    <span class="metric-value">{{ metric.value }}</span>
                    <span class="metric-change" :class="metric.trend">
                        {{ metric.change }}
                    </span>
                </div>
            </div>
        </div>
        <div class="chart">
            <div class="bar" v-for="(value, index) in chartData" :key="index" :style="{ height: value + '%' }"></div>
        </div>
        <p class="timestamp">Updated: {{ updateTime }}</p>
    </div>
</template>

<style scoped>
.analytics-widget {
    background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
    padding: 20px;
    border-radius: 12px;
    color: white;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}

.analytics-widget h3 {
    margin: 0 0 20px 0;
    font-size: 18px;
    border-bottom: 2px solid rgba(255, 255, 255, 0.3);
    padding-bottom: 10px;
}

.metrics {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
    gap: 15px;
    margin-bottom: 20px;
}

.metric {
    background: rgba(255, 255, 255, 0.15);
    padding: 15px;
    border-radius: 8px;
    display: flex;
    gap: 12px;
    backdrop-filter: blur(10px);
}

.metric-icon {
    font-size: 32px;
    display: flex;
    align-items: center;
}

.metric-info {
    display: flex;
    flex-direction: column;
    gap: 4px;
}

.metric-label {
    font-size: 12px;
    color: rgba(255, 255, 255, 0.8);
    text-transform: uppercase;
    font-weight: 500;
}

.metric-value {
    font-size: 20px;
    font-weight: bold;
}

.metric-change {
    font-size: 12px;
    padding: 2px 8px;
    border-radius: 10px;
    display: inline-block;
    width: fit-content;
}

.metric-change.up {
    background: rgba(76, 175, 80, 0.3);
}

.metric-change.down {
    background: rgba(33, 150, 243, 0.3);
}

.chart {
    display: flex;
    align-items: flex-end;
    gap: 8px;
    height: 100px;
    background: rgba(255, 255, 255, 0.1);
    padding: 15px;
    border-radius: 8px;
    margin-bottom: 15px;
}

.bar {
    flex: 1;
    background: rgba(255, 255, 255, 0.6);
    border-radius: 4px 4px 0 0;
    min-height: 10%;
    transition: all 0.3s ease;
}

.bar:hover {
    background: rgba(255, 255, 255, 0.9);
}

.timestamp {
    font-size: 11px;
    color: rgba(255, 255, 255, 0.5);
    text-align: center;
    font-style: italic;
    margin: 0;
}
</style>
