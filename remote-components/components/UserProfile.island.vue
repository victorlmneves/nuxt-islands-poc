<script setup lang="ts">
const props = withDefaults(
    defineProps<{
        userId: string;
    }>(),
    {
        userId: '1',
    }
);

// Simulate fetching data on the server
const user = ref({
    id: props.userId,
    name: `User ${props.userId}`,
    avatar: '🧑‍💻',
    role: 'Senior Developer',
    email: `user${props.userId}@example.com`,
    posts: Math.floor(Math.random() * 100),
    followers: Math.floor(Math.random() * 1000),
    active: Math.random() > 0.5,
});

const renderTime = new Date().toLocaleTimeString();
console.log("🚀 ~ renderTime:", renderTime)

const statusClass = computed(() => (user.value.active ? 'active' : 'inactive'));
const statusText = computed(() => (user.value.active ? '🟢 Online' : '🔴 Offline'));
</script>

<template>
    <div class="user-profile">
        <h3>👤 User Profile (Remote Component)</h3>
        <div class="profile-card">
            <div class="avatar">{{ user.avatar }}</div>
            <div class="info">
                <h4>{{ user.name }}</h4>
                <p class="role">{{ user.role }}</p>
                <p class="email">{{ user.email }}</p>
                <p class="status" :class="statusClass">{{ statusText }}</p>
            </div>
            <div class="stats">
                <div class="stat">
                    <span class="label">Posts</span>
                    <span class="value">{{ user.posts }}</span>
                </div>
                <div class="stat">
                    <span class="label">Followers</span>
                    <span class="value">{{ user.followers }}</span>
                </div>
            </div>
        </div>
        <p class="timestamp">Rendered at: {{ renderTime }}</p>
    </div>
</template>

<style scoped>
.user-profile {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    padding: 20px;
    border-radius: 12px;
    color: white;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}

.user-profile h3 {
    margin: 0 0 15px 0;
    font-size: 18px;
    border-bottom: 2px solid rgba(255, 255, 255, 0.3);
    padding-bottom: 10px;
}

.profile-card {
    background: rgba(255, 255, 255, 0.1);
    padding: 20px;
    border-radius: 8px;
    backdrop-filter: blur(10px);
}

.avatar {
    font-size: 60px;
    text-align: center;
    margin-bottom: 15px;
}

.info {
    text-align: center;
    margin-bottom: 20px;
}

.info h4 {
    margin: 0 0 5px 0;
    font-size: 24px;
}

.role {
    color: rgba(255, 255, 255, 0.8);
    margin: 5px 0;
    font-size: 14px;
}

.email {
    color: rgba(255, 255, 255, 0.6);
    font-size: 12px;
    margin: 5px 0;
}

.status {
    margin: 10px 0;
    padding: 5px 15px;
    border-radius: 20px;
    display: inline-block;
    font-size: 14px;
}

.status.active {
    background: rgba(76, 175, 80, 0.3);
}

.status.inactive {
    background: rgba(244, 67, 54, 0.3);
}

.stats {
    display: flex;
    justify-content: space-around;
    gap: 20px;
    margin-top: 15px;
}

.stat {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 5px;
}

.stat .label {
    font-size: 12px;
    color: rgba(255, 255, 255, 0.7);
    text-transform: uppercase;
}

.stat .value {
    font-size: 24px;
    font-weight: bold;
}

.timestamp {
    margin-top: 15px;
    font-size: 11px;
    color: rgba(255, 255, 255, 0.5);
    text-align: center;
    font-style: italic;
}
</style>
