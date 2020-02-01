/*-
 * Copyright (c) 2020 Tudor Plugaru (https://github.com/PlugaruT/wingpanel-monitor)
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301 USA.
 *
 * Authored by: Tudor Plugaru <plugaru.tudor@gmail.com>
 */

namespace WingpanelMonitor {
    public class TogglesWidget : Gtk.Grid {
        private Wingpanel.Widgets.Switch cpu_switch;
        private Wingpanel.Widgets.Switch ram_switch;
        private Wingpanel.Widgets.Switch network_switch;
        private Wingpanel.Widgets.Switch label_description_switch;
        private Wingpanel.Widgets.Switch graph_switch;
        private Wingpanel.Widgets.Switch indicator_icon_switch;

        private Wingpanel.Widgets.Switch indicator;

        public static GLib.Settings settings;

        public TogglesWidget () {
            hexpand = true;
        }

        construct {
            orientation = Gtk.Orientation.VERTICAL;
            settings = new GLib.Settings ("com.github.plugarut.wingpanel-monitor");

            cpu_switch = new Wingpanel.Widgets.Switch ("CPU usage", settings.get_boolean ("show-cpu"));
            ram_switch = new Wingpanel.Widgets.Switch ("RAM usage", settings.get_boolean ("show-ram"));
            network_switch = new Wingpanel.Widgets.Switch ("Network usage", settings.get_boolean ("show-network"));
            label_description_switch = new Wingpanel.Widgets.Switch ("Labels", settings.get_boolean ("show-desr"));
            graph_switch = new Wingpanel.Widgets.Switch ("Graphs", settings.get_boolean ("show-graph"));
            indicator_icon_switch = new Wingpanel.Widgets.Switch ("Indicator icon", settings.get_boolean ("show-icon"));

            indicator = new Wingpanel.Widgets.Switch ("ON/OFF", settings.get_boolean ("display-indicator"));

            var separator_start = new Wingpanel.Widgets.Separator ();
            separator_start.hexpand = true;

            var separator_end = new Wingpanel.Widgets.Separator ();
            separator_end.hexpand = true;

            var minimize_button = new Gtk.ModelButton ();
            minimize_button.text = "Minimize Window";
            minimize_button.get_style_context ().add_class ("menuitem");
            minimize_button.get_style_context ().remove_class ("button");


            settings.bind ("display-indicator", indicator.get_switch (), "active", SettingsBindFlags.DEFAULT);

            settings.bind ("show-cpu", cpu_switch.get_switch (), "active", SettingsBindFlags.DEFAULT);
            settings.bind ("show-ram", ram_switch.get_switch (), "active", SettingsBindFlags.DEFAULT);
            settings.bind ("show-network", network_switch.get_switch (), "active", SettingsBindFlags.DEFAULT);
            settings.bind ("show-desr", label_description_switch.get_switch (), "active", SettingsBindFlags.DEFAULT);
            settings.bind ("show-graph", graph_switch.get_switch (), "active", SettingsBindFlags.DEFAULT);
            settings.bind ("show-icon", indicator_icon_switch.get_switch (), "active", SettingsBindFlags.DEFAULT);


            add (indicator);
            add (new Wingpanel.Widgets.Separator ());
            add (cpu_switch);
            add (ram_switch);
            add (network_switch);
            add (new Wingpanel.Widgets.Separator ());
            add (minimize_button);
        }
    }
}