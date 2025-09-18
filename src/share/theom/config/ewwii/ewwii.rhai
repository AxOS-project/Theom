fn metric(label, value, onchange, timeout) {
    let need_active = onchange != "";

    box(#{
        orientation: "h",
        class: "metric",
        space_evenly: false,
    }, [
        box(#{ class: "label" }, [
            label(#{ text: label }),
        ]),
        slider(#{
            min: 0,
            max: 101,
            active: need_active,
            value: value,
            onchange: onchange,
            timeout: timeout,
        })
    ])
}

// widgets
fn bar(
    // bar
    theme,

    // center
    music, is_playing,

    // left
    workspace_1, workspace_2, workspace_3, workspace_4,
    workspace_5, workspace_6, workspace_7, workspace_8,
    workspace_9, workspace_10, mem_usage_perc,

    // right
    battery_state, battery_percent, volume, time
) {
    centerbox(#{ 
        visible: theme != "",
        class: if theme == "light" { 
            "bar light-theme" 
        } else if theme == "dark" {
            "bar dark-theme" 
        } else { "bar" },
        orientation: "h",
    }, [
        left(
            workspace_1, workspace_2, workspace_3, workspace_4,
            workspace_5, workspace_6, workspace_7, workspace_8,
            workspace_9, workspace_10, mem_usage_perc
        ),
        center(music, is_playing),
        right(battery_state, battery_percent, volume, time),
    ])
}

fn cal(day, year, theme) {
    box(#{
        visible: theme != "",
        class: if theme == "light" {
            "cal light-theme"
        } else if theme == "dark" {
             "cal dark-theme" 
        } else { "cal" },
        orientation: "v",
    }, [
        box(#{ class: "calendar", orientation: "v" }, [
            box(#{ class: "calendar-in" }, [
                calendar(#{
                    class: "calendar",
                    day: day,
                    year: year,
                })
            ])
        ])
    ])
}
    
fn separator() {
    box(#{
        class: "separator",
        width: "1px",
        height: "20px",
        margin: "0 8px",
    }, [])
}

fn right(battery_state, battery_percent, volume, time) {
    // battery box class:
    let battery_box_class = if battery_state == "charging" {
        "battery-charging"
    } else if battery_state == "fully-charged" {
        "battery-full"
    } else {
        "battery-discharging"
    };

    box(#{
        class: "right", orientation: "h", space_evenly: false, halign: "end",
    }, [
        box(#{ visible: battery_state != "unknown" }, [
            button(#{
                onclick: "scripts/power_profiles_popup",
                timeout: "5s",
                class: battery_box_class,
                label: `󰁹 ${battery_percent}% `,
            }),
        ]),

        separator(),

        metric("", volume, "pamixer --set-volume {}", "500ms"),

        box(#{ class: "tray-items" }, [
            button(#{
                onclick: "tnotifications --position TR --margin-x 10 --margin-y 40 &",
                class: "notification-popup",
                label: "",
            }),

            button(#{
                onclick: "scripts/open-systray",
                timeout: "5s",
                class: "systray-open",
                label: "",
            })
        ]),

        button(#{ 
            onclick: "scripts/calendar_popup", 
            timeout: "5s", 
            label: " : " + time,
        }),
    ])
}

fn left(
    workspace_1, workspace_2,
    workspace_3, workspace_4,
    workspace_5, workspace_6,
    workspace_7, workspace_8,
    workspace_9, workspace_10,
    mem_usage_perc
) {
    box(#{
        class: "workspace",
        orientation: "h",
        space_evenly: false,
        halign: "start",
        spacing: 5,
    }, [
        button(#{ onclick: "i3-msg workspace 1", label: workspace_1 }),
        button(#{ onclick: "i3-msg workspace 2", label: workspace_2 }),
        button(#{ onclick: "i3-msg workspace 3", label: workspace_3 }),
        button(#{ onclick: "i3-msg workspace 4", label: workspace_4 }),
        button(#{ onclick: "i3-msg workspace 5", label: workspace_5 }),
        button(#{ onclick: "i3-msg workspace 6", label: workspace_6 }),
        button(#{ onclick: "i3-msg workspace 7", label: workspace_7 }),
        button(#{ onclick: "i3-msg workspace 8", label: workspace_8 }),
        button(#{ onclick: "i3-msg workspace 9", label: workspace_9 }),
        button(#{ onclick: "i3-msg workspace 10", label: workspace_10 }),

        separator(),

        metric("", mem_usage_perc, "", "1s"),
    ])
}

fn center(music, is_playing) {
    let play_btn_label = if !(is_playing == "true") { "󰐊" } else { "" };

    box(#{
        class: "center",
        orientation: "h",
        space_evenly: false,
        halign: "center",
    }, [
        // title
        label(#{ text: ": " + music }),

        box(#{ width: "10px" }, []), // spacing

        // Previous button
        button(#{ onclick: "mpc prev", label: "󰒮" }),

        // Play button
        button(#{
            onclick: "mpc toggle",
            label: play_btn_label, // can be both play/pause button
        }),

        // Next track button
        button(#{ onclick: "mpc next", label: "󰒭" }),
    ])
}

enter([
    poll("theme", #{ interval: "5min", cmd: "scripts/get_theme" }),
    poll("day", #{ interval: "20h", cmd: "date '+%d'" }),
    poll("year", #{ interval: "20h", cmd: "date '+%Y'" }),

    poll("power_profile", #{ interval: "1s", cmd: "scripts/power_profiles_popup get" }),
    listen("is_playing", #{ initial: "false", cmd: "scripts/music" }),

    listen("music", #{ initial: "", cmd: "scripts/music_title" }),

    poll("battery_state", #{ interval: "2s", initial: "unknown", cmd: "scripts/getbattery state" }),
    poll("battery_percent", #{ interval: "2s", initial: "0", cmd: "scripts/getbattery percent" }),

    listen("volume", #{ initial: "", cmd: "scripts/getvol" }),

    poll("time", #{ interval: "10s", cmd: "date '+%H:%M'" }),

    // It looks absurd but i had to do it.. :(
    // I tried other methods, but this just works!
    listen("workspace_1", #{ initial: "·", cmd: "scripts/workspace 1" }),
    listen("workspace_2", #{ initial: "·", cmd: "scripts/workspace 2" }),
    listen("workspace_3", #{ initial: "·", cmd: "scripts/workspace 3" }),
    listen("workspace_4", #{ initial: "·", cmd: "scripts/workspace 4" }),
    listen("workspace_5", #{ initial: "·", cmd: "scripts/workspace 5" }),
    listen("workspace_6", #{ initial: "·", cmd: "scripts/workspace 6" }),
    listen("workspace_7", #{ initial: "·", cmd: "scripts/workspace 7" }),
    listen("workspace_8", #{ initial: "·", cmd: "scripts/workspace 8" }),
    listen("workspace_9", #{ initial: "·", cmd: "scripts/workspace 9" }),
    listen("workspace_10", #{ initial: "·", cmd: "scripts/workspace 10" }),

    poll("mem_usage_perc", #{ 
        interval: "2s",
        initial: "0%", 
        cmd: "awk '/MemTotal/ {total=$2} /MemAvailable/ {avail=$2} END {print (total-avail)/total*100}' /proc/meminfo",
    }),

    // windows
    defwindow("bar", #{
        monitor: 0,
        windowtype: "dock",
        geometry: #{ 
            x: "0%",
            y: "0%",
            width: "100%",
            height: "10px",
            anchor: "top center",
        },
        stacking: "fg",
        exclusive: true,
    }, bar(
        theme,

        music, is_playing,

        workspace_1, workspace_2, workspace_3, workspace_4,
        workspace_5, workspace_6, workspace_7, workspace_8,
        workspace_9, workspace_10, mem_usage_perc,

        battery_state, battery_percent, volume, time
    )),

    defwindow("calendar_popup", #{
        geometry: #{
            x: "-10px",
            y: "60px",
            anchor: "top right",
            width: "270px",
            height: "60px"
        },
        windowtype: "dialog",
    }, cal(day, year, theme)),

    defwindow("power_popup", #{
        geometry: #{
            x: "-15%",
            y: "7%",
            anchor: "top right",
            width: "200px",
            height: "150px"
        },
        windowtype: "dialog",
    }, box(#{ 
        class: if theme == "light" { 
            "power_profiles_popup light-theme" 
        } else if theme == "dark"  { 
            "power_profiles_popup dark-theme" 
        } else { "power_profiles_popup" },
        orientation: "v",
        spacing: 8,
    }, [
        box(#{ class: "popup-header" }, [ 
            label(#{ text: "Power Profiles", class: "popup-title" }) 
        ]),
        button(#{ 
            class: "profile-button " + if power_profile == "power-saver" {
                "active"
            } else { "" },
            onclick: "~/.config/ewwii/scripts/power_profiles_popup set power-saver && ~/.config/ewwii/scripts/power_profiles_popup popup",
            label: "Power Saver"
        }),
        button(#{ 
            class: "profile-button " + if power_profile == "balanced" {
                "active"
            } else { "" },
            onclick: "~/.config/ewwii/scripts/power_profiles_popup set balanced && ~/.config/ewwii/scripts/power_profiles_popup popup",
            label: "Balanced"
        }),
        button(#{ 
            class: "profile-button " + if power_profile == "performance" {
                "active"
            } else { "" },
            onclick: "~/.config/ewwii/scripts/power_profiles_popup set performance && ~/.config/ewwii/scripts/power_profiles_popup popup",
            label: "Performance"
        }),
    ])),
]);
