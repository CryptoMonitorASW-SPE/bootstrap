import { test, expect } from '@playwright/test';
import { randomUUID } from 'crypto';


// Test for unauthenticated users.
test('Crypto Table visible for unauthenticated user', async ({ page }) => {
    
    // Navigate to the homepage (assumed to contain the crypto-table).
    await page.goto('http://localhost:8080/');
    // Verify that the crypto-table element is visible.
    const cryptoTable = page.locator('.crypto-table');
    
    await expect(cryptoTable).toBeVisible();
  });

test.describe('Authenticated Routes', () => {
  test.beforeEach(async ({ page }) => {
    await page.context().clearCookies();
    // Navigate to the signup page.
    await page.goto('http://localhost:8080/signup');

    const userId = Date.now();
    const uuid = randomUUID();
    const uniqueEmail = `test_${userId}_${uuid}@example.com`;

    // Signup
    await page.fill('input[type="email"]', uniqueEmail);
    await page.fill('input[type="password"]', 'password123');
    await page.click('button[type="submit"]');
    await page.waitForURL('http://localhost:8080/login');
    await expect(page).toHaveURL('http://localhost:8080/login');

    // Login
    await page.fill('input[type="email"]', uniqueEmail);
    await page.fill('input[type="password"]', 'password123');
    await page.click('button[type="submit"]');
    await page.waitForURL('http://localhost:8080/');
    await expect(page).toHaveURL('http://localhost:8080/');
  });

  test('Crypto Table visible for authenticated user', async ({ page }) => {
    // Navigate to the homepage (assumed to contain the crypto-table).
    await page.goto('http://localhost:8080/');
    await page.waitForURL('http://localhost:8080/');
    await expect(page).toHaveURL('http://localhost:8080/');
    // Verify that the crypto-table element is visible.
    const cryptoTable = page.locator('.crypto-table');
    await expect(cryptoTable).toBeVisible();
  });

  test('Visit /login as authenticated user', async ({ page }) => {
    await page.goto('http://localhost:8080/login');
    // Should redirect to home page.
    await page.waitForURL('http://localhost:8080/');
    await expect(page).toHaveURL('http://localhost:8080/');
  });

  test('Visit /wallet as authenticated user', async ({ page }) => {
    await page.goto('http://localhost:8080/wallet');
    await page.waitForURL('http://localhost:8080/wallet');
    await expect(page).toHaveURL('http://localhost:8080/wallet');
    // Verify an element that uniquely identifies the wallet page.
    const walletHeader = page.locator('h1', { hasText: 'Wallet' });
    await expect(walletHeader).toBeVisible();
  });

  test('Visit /profile as authenticated user', async ({ page }) => {
    await page.goto('http://localhost:8080/profile');
    await page.waitForURL('http://localhost:8080/profile');
    await expect(page).toHaveURL('http://localhost:8080/profile');
    // Verify an element that uniquely identifies the wallet page.
    const walletHeader = page.locator('h2', { hasText: 'User Profile' });
    await expect(walletHeader).toBeVisible();
  });

  test('Visit /watchlist as authenticated user', async ({ page }) => {
    await page.goto('http://localhost:8080/watchlist');
    await page.waitForURL('http://localhost:8080/watchlist');
    await expect(page).toHaveURL('http://localhost:8080/watchlist');
    // Verify an element that uniquely identifies the watchlist page.
    const watchlistHeader = page.locator('h2', { hasText: 'Watched Cryptocurrencies' });
    await expect(watchlistHeader).toBeVisible();
  });
});