import { defineConfig } from 'cypress'

export default defineConfig({
  chromeWebSecurity: false,
  projectId: 'uga496',
  experimentalStudio: true,
  screenshotOnRunFailure: true,
  video: true,
  e2e: {
    // We've imported your old cypress plugins here.
    // You may want to clean this up later by importing these.
    setupNodeEvents(on, config) {
      return require('./cypress/plugins/index.js')(on, config)
    },
    baseUrl: 'https://automationexercise.com/',
    specPattern: 'cypress/e2e/**/*.{js,jsx,ts,tsx}',
  },
})
