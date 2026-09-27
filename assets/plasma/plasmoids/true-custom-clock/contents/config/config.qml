/*
    SPDX-FileCopyrightText: 2013 Bhushan Shah <bhush94@gmail.com>
    SPDX-FileCopyrightText: 2015 Martin Klapetek <mklapetek@kde.org>

    SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only OR LicenseRef-KDE-Accepted-GPL
*/

pragma ComponentBehavior: Bound

import QtQuick
import org.kde.plasma.configuration 2.0

ConfigModel {
    ConfigCategory {
        name: "Appearance"
        icon: "preferences-desktop-theme"
        source: "configAppearance.qml"
    }
    ConfigCategory {
        name: "Time Zones"
        icon: "preferences-system-time"
        source: "configTimeZones.qml"
    }
    ConfigCategory {
        name: "Calendar"
        icon: "appointment-new"
        source: "configCalendar.qml"
    }
}
