<script setup lang="ts">
const props = withDefaults(
    defineProps<{
        limit: number;
    }>(),
    {
        limit: 5,
    }
);

const allNotifications = [
    {
        id: 1,
        type: 'success',
        icon: '✅',
        title: 'Deploy Successful',
        message: 'Your application was deployed to production',
        time: '2 minutes ago',
    },
    {
        id: 2,
        type: 'warning',
        icon: '⚠️',
        title: 'High Memory Usage',
        message: 'Server memory usage is above 80%',
        time: '15 minutes ago',
    },
    {
        id: 3,
        type: 'info',
        icon: 'ℹ️',
        title: 'New Update Available',
        message: 'Version 2.5.0 is ready to install',
        time: '1 hour ago',
    },
    {
        id: 4,
        type: 'error',
        icon: '❌',
        title: 'Build Failed',
        message: 'TypeScript compilation error in auth.ts',
        time: '3 hours ago',
    },
    {
        id: 5,
        type: 'success',
        icon: '🎉',
        title: 'New User Registered',
        message: 'Welcome user@example.com to your platform',
        time: '5 hours ago',
    },
];

const notifications = computed(() => allNotifications.slice(0, props.limit));
</script>

<template>
    <div class="notifications-widget">
        <h3>🔔 Notifications (Remote Component)</h3>
        <div class="notification-list">
            <div class="notification" v-for="notification in notifications" :key="notification.id" :class="notification.type">
                <div class="notification-icon">{{ notification.icon }}</div>
                <div class="notification-content">
                    <p class="notification-title">{{ notification.title }}</p>
                    <p class="notification-message">{{ notification.message }}</p>
                    <span class="notification-time">{{ notification.time }}</span>
                </div>
            </div>
        </div>
        <p class="count">Showing {{ limit }} of {{ notifications.length }} notifications</p>
    </div>
</template>

<style scoped>
.notifications-widget {
    background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
    padding: 20px;
    border-radius: 12px;
    color: white;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}

.notifications-widget h3 {
    margin: 0 0 15px 0;
    font-size: 18px;
    border-bottom: 2px solid rgba(255, 255, 255, 0.3);
    padding-bottom: 10px;
}

.notification-list {
    display: flex;
    flex-direction: column;
    gap: 10px;
    margin-bottom: 15px;
}

.notification {
    background: rgba(255, 255, 255, 0.15);
    padding: 12px;
    border-radius: 8px;
    display: flex;
    gap: 12px;
    backdrop-filter: blur(10px);
    border-left: 4px solid transparent;
}

.notification.success {
    border-left-color: #4caf50;
}

.notification.warning {
    border-left-color: #ff9800;
}

.notification.error {
    border-left-color: #f44336;
}

.notification.info {
    border-left-color: #2196f3;
}

.notification-icon {
    font-size: 24px;
    display: flex;
    align-items: flex-start;
}

.notification-content {
    flex: 1;
    display: flex;
    flex-direction: column;
    gap: 4px;
}

.notification-title {
    margin: 0;
    font-weight: bold;
    font-size: 14px;
}

.notification-message {
    margin: 0;
    font-size: 13px;
    color: rgba(255, 255, 255, 0.9);
    line-height: 1.4;
}

.notification-time {
    font-size: 11px;
    color: rgba(255, 255, 255, 0.6);
    font-style: italic;
}

.count {
    font-size: 12px;
    color: rgba(255, 255, 255, 0.7);
    text-align: center;
    margin: 0;
}
</style>
