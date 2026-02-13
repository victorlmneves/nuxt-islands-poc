export default defineNuxtConfig({
    compatibilityDate: '2024-11-01',

    devtools: { enabled: true },

    experimental: {
        componentIslands: true,
    },

    nitro: {
        experimental: {
            openAPI: true,
        },
        prerender: {
            crawlLinks: true,
        },
    },

    routeRules: {
        '/__nuxt_island/**': {
            cors: true,
            headers: {
                'Access-Control-Allow-Origin': '*',
                'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
                'Access-Control-Allow-Headers': 'Content-Type',
            },
        },
    },

    app: {
        head: {
            charset: 'utf-8',
            viewport: 'width=device-width, initial-scale=1',
        },
    },
});
