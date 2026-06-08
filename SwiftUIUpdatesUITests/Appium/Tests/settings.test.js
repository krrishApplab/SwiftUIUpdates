describe('Settings screen', () => {
    before(async () => {
        const settingsTab = await $('~tab.settings')
        await settingsTab.waitForExist({ timeout: 20000 })
        await settingsTab.click()
    })

    it('shows the theme picker', async () => {
        const themePicker = await $('~settings.theme.picker')
        await themePicker.waitForExist({ timeout: 10000 })
        expect(await themePicker.isExisting()).toBe(true)
    })

    it('shows the app version', async () => {
        const appVersion = await $('~settings.appVersion')
        await appVersion.waitForExist({ timeout: 10000 })
        expect(await appVersion.isExisting()).toBe(true)
    })
})
