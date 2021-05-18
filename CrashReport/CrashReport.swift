//
//  CrashReport.swift
//
//  Created by kerubito on 2021/05/18.
//

import Foundation
import KSCrash

internal class CrashReport {
    internal static func fetch() {
        guard let kscrash = KSCrashInstallationConsole.sharedInstance() else { return }
        kscrash.install()
        kscrash.sendAllReports { reports, completed, error in
            guard let reports = reports, reports.count > 0 else {
                return
            }
            if let error = error {
                print("\(error)")
                return
            }
            reports.forEach { report in
                print("\(report)")
            }

        }
    }
}
