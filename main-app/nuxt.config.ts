// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
    compatibilityDate: '2024-11-01',

    devtools: { enabled: true },

    experimental: {
        componentIslands: 'local+remote',
    },

    nitro: {
        experimental: {
            openAPI: true,
        },
        prerender: {
            crawlLinks: true,
        },
    },

    app: {
        head: {
            charset: 'utf-8',
            viewport: 'width=device-width, initial-scale=1',
        },
    },
});
