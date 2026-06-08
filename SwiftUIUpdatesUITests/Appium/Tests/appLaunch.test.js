import { tabs } from '../Helpers/capabilities.js'

const tabBarButtonsChain = '-ios class chain:**/XCUIElementTypeTabBar/**/XCUIElementTypeButton'

async function tabBarButtons() {
    return $$(tabBarButtonsChain)
}

describe('SwiftUIUpdates app launch', () => {
    before(async () => {
        await $('~tab.home').waitForExist({ timeout: 20000 })
    })

    it('launches and shows the home tab content', async () => {
        const homeContent = await $('~tab.home')
        expect(await homeContent.isExisting()).toBe(true)
    })

    it('exposes all tab bar buttons with expected titles', async () => {
        const buttons = await tabBarButtons()
        expect(buttons.length).toBe(tabs.length)

        const names = []
        for (const button of buttons) {
            names.push(await button.getAttribute('name'))
        }
        expect(names).toEqual(tabs.map((tab) => tab.title))
    })

    it('navigates to each tab and shows its content', async () => {
        for (let index = 0; index < tabs.length; index += 1) {
            const buttons = await tabBarButtons()
            await buttons[index].click()

            const content = await $(`~${tabs[index].contentIdentifier}`)
            await content.waitForExist({ timeout: 10000 })
            expect(await content.isExisting()).toBe(true)
        }
    })
})
