const searchFieldChain = '-ios class chain:**/XCUIElementTypeSearchField'

async function searchField() {
    return $(searchFieldChain)
}

describe('Search screen', () => {
    before(async () => {
        const searchTab = await $('~tab.search')
        await searchTab.waitForExist({ timeout: 20000 })
        await searchTab.click()
    })

    it('shows the full list when the search text is empty', async () => {
        const list = await $('~search.list')
        await list.waitForExist({ timeout: 10000 })
        expect(await list.isExisting()).toBe(true)

        const firstItem = await $('~search.row.Avocado')
        await firstItem.waitForExist({ timeout: 10000 })
        expect(await firstItem.isExisting()).toBe(true)
    })

    it('filters the list in real time as the user types', async () => {
        const field = await searchField()
        await field.waitForExist({ timeout: 10000 })
        await field.click()
        await field.setValue('Banana')

        const match = await $('~search.row.Banana')
        await match.waitForExist({ timeout: 10000 })
        expect(await match.isExisting()).toBe(true)

        const nonMatch = await $('~search.row.Avocado')
        expect(await nonMatch.isExisting()).toBe(false)
    })

    it('shows the empty state when no results match', async () => {
        const field = await searchField()
        await field.waitForExist({ timeout: 10000 })
        await field.clearValue()
        await field.setValue('zzzzzz')

        const emptyState = await $('~search.emptyState')
        await emptyState.waitForExist({ timeout: 10000 })
        expect(await emptyState.isExisting()).toBe(true)
    })

    it('restores the full list when the search text is cleared', async () => {
        const field = await searchField()
        await field.clearValue()

        const firstItem = await $('~search.row.Avocado')
        await firstItem.waitForExist({ timeout: 10000 })
        expect(await firstItem.isExisting()).toBe(true)
    })
})
