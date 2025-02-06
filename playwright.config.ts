// playwright.config.js
/** @type {import('@playwright/test').PlaywrightTestConfig} */
module.exports = {
  timeout: 30000, // global timeout for each test in ms
  use: {
    headless: true, // set to false if you want to see the browser
    viewport: { width: 1280, height: 720 },
    // any other global settings you need
  },
  testDir: './tests', // where your tests are located
};

