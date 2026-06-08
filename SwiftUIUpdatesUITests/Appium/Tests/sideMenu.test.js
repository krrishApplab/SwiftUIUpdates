describe('Home side menu', () => {
    before(async () => {
        const homeTab = await $('~tab.home')
        await homeTab.waitForExist({ timeout: 20000 })
        await homeTab.click()
    })

    it('opens the side menu from the menu button', async () => {
        const menuButton = await $('~home.menuButton')
        await menuButton.waitForExist({ timeout: 10000 })
        await menuButton.click()

        const panel = await $('~sidemenu.panel')
        await panel.waitForExist({ timeout: 10000 })
        expect(await panel.isExisting()).toBe(true)
    })

    it('closes the side menu when an item is selected', async () => {
        const settingsItem = await $('~sidemenu.settings')
        await settingsItem.waitForExist({ timeout: 10000 })
        await settingsItem.click()

        const panel = await $('~sidemenu.panel')
        await panel.waitForExist({ timeout: 10000, reverse: true })
        expect(await panel.isExisting()).toBe(false)
    })
})
