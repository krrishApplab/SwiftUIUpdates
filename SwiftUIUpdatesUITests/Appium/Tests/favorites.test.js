describe('Favourites screen', () => {
    before(async () => {
        const favoritesTab = await $('~tab.favorites')
        await favoritesTab.waitForExist({ timeout: 20000 })
        await favoritesTab.click()
    })

    it('shows the favourites list', async () => {
        const list = await $('~favorites.list')
        await list.waitForExist({ timeout: 10000 })
        expect(await list.isExisting()).toBe(true)
    })

    it('filters the list as the user types', async () => {
        const searchField = await $('-ios class chain:**/XCUIElementTypeSearchField')
        await searchField.waitForExist({ timeout: 10000 })
        await searchField.click()
        await searchField.setValue('Morning Run')

        const match = await $('~favorites.row.Morning Run')
        await match.waitForExist({ timeout: 10000 })
        expect(await match.isExisting()).toBe(true)
    })

    it('shows the empty state when no favourite matches', async () => {
        const searchField = await $('-ios class chain:**/XCUIElementTypeSearchField')
        await searchField.click()
        await searchField.setValue('zzzznomatch')

        const emptyState = await $('~favorites.emptyState')
        await emptyState.waitForExist({ timeout: 10000 })
        expect(await emptyState.isExisting()).toBe(true)
    })
})
