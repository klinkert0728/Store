//
//  KNMTCRealmModel.swift
//  Velocity
//
//  Created by Daniel Klinkert Houfer on 1/31/17.
//  Copyright © 2017 Knomatic. All rights reserved.
//

import UIKit
import RealmSwift

let newDBVersion:UInt64 = 1

class KNMTCRealmModel {
    
    
    class func realmMigrate() {
        
        let currentVersion = Realm.Configuration.defaultConfiguration.schemaVersion
        
        if currentVersion == newDBVersion {
            //db updated
            return
        }
        
        let migrationBlock: MigrationBlock = { migration, oldSchemaVersion in
            
            print("Migration complete.")
        }
        
        
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: newDBVersion, migrationBlock: migrationBlock)
        
    }
}
