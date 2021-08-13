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
            
            let jsons: [Any] = reports.compactMap { report in
                guard let data = "\(report)".data(using: .utf8),
                      let json = try? JSONSerialization.jsonObject(with: data) else { return nil }
                return json
            }
            guard let filter = KSCrashReportFilterAppleFmt.filter(with: KSAppleReportStyleSymbolicatedSideBySide) else {
                return
            }
            filter.filterReports(jsons, onCompletion: { reports, completed, error in
                if let error = error {
                    print("\(error)")
                    return
                }
                if completed, let reports = reports {
                    reports.forEach { report in
                        print("\(report)")
                    }
                }
            })
        }
    }
}
