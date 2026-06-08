import { config as helperConfig } from '../Helpers/capabilities.js'
import { ReportAggregator } from 'wdio-html-nice-reporter'

const reportOptions = {
    outputDir: './Reports/',
    filename: 'appium-report.html',
    reportTitle: 'SwiftUIUpdates Appium UI Test Report',
    showInBrowser: false,
    collapseTests: false,
    useOnAfterCommandForScreenshot: false
}

let reportAggregator

export const config = {
    runner: 'local',
    port: 4723,
    specs: ['../Tests/**/*.test.js'],
    maxInstances: 1,
    services: ['appium'],
    capabilities: [helperConfig.iosCapabilities],
    logLevel: 'info',
    bail: 0,
    waitforTimeout: 10000,
    connectionRetryTimeout: 120000,
    connectionRetryCount: 3,
    framework: 'mocha',
    reporters: ['spec', ['html-nice', reportOptions]],
    mochaOpts: {
        ui: 'bdd',
        timeout: 120000
    },
    onPrepare() {
        reportAggregator = new ReportAggregator(reportOptions)
        reportAggregator.clean()
    },
    async onComplete() {
        await reportAggregator.createReport()
        console.log(`HTML report generated at: SwiftUIUpdatesUITests/Appium/Reports/${reportOptions.filename}`)
    }
}
