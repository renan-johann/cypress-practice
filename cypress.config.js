const { defineConfig } = require('cypress')

module.exports = defineConfig({
  chromeWebSecurity: false,
  projectId: 'e2e',
  experimentalStudio: true,
  screenshotOnRunFailure: true,
  video: true,
  e2e: {
      baseUrl: 'https://automationexercise.com/',
      specPattern: 'cypress/e2e/**/*.{js,jsx,ts,tsx}',
  },
})