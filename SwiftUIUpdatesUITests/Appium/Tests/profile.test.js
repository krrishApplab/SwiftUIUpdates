describe('Profile screen', () => {
    before(async () => {
        const profileTab = await $('~tab.profile')
        await profileTab.waitForExist({ timeout: 20000 })
        await profileTab.click()
    })

    it('shows the profile header', async () => {
        const name = await $('~profile.name')
        const email = await $('~profile.email')
        const editButton = await $('~profile.editButton')

        await name.waitForExist({ timeout: 10000 })
        expect(await name.isExisting()).toBe(true)
        expect(await email.isExisting()).toBe(true)
        expect(await editButton.isExisting()).toBe(true)
    })

    it('shows the statistics cards', async () => {
        const posts = await $('~profile.stat.posts')
        const followers = await $('~profile.stat.followers')

        await posts.waitForExist({ timeout: 10000 })
        expect(await posts.isExisting()).toBe(true)
        expect(await followers.isExisting()).toBe(true)
    })

    it('opens and dismisses the edit profile sheet', async () => {
        const editButton = await $('~profile.editButton')
        await editButton.click()

        const nameField = await $('~editProfile.nameField')
        await nameField.waitForExist({ timeout: 10000 })
        expect(await nameField.isExisting()).toBe(true)

        const cancel = await $('~editProfile.cancel')
        await cancel.click()
        await nameField.waitForExist({ timeout: 10000, reverse: true })
        expect(await nameField.isExisting()).toBe(false)
    })
})
