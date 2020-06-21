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
    public class DiskWidget : Gtk.Grid {
        private Gtk.Revealer widget_revealer;
        private Gtk.Label read_label;
        private Gtk.Label write_label;

        public bool display {
            set { widget_revealer.reveal_child = value; }
            get { return widget_revealer.get_reveal_child () ; }
        }

        construct {
            orientation = Gtk.Orientation.HORIZONTAL;

            read_label = new Gtk.Label ("N/A");
            read_label.set_width_chars (8);
            read_label.halign = Gtk.Align.START;
            var read_label_context = read_label.get_style_context ();
            read_label_context.add_class ("small-label");
            read_label_context.add_class ("read");

            write_label = new Gtk.Label ("N/A");
            write_label.set_width_chars (8);
            write_label.halign = Gtk.Align.END;
            var write_label_context = write_label.get_style_context ();
            write_label_context.add_class ("small-label");
            write_label_context.add_class ("write");

            var group = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);
            group.add (read_label);
            group.add (write_label);

            widget_revealer = new Gtk.Revealer ();
            widget_revealer.transition_type = Gtk.RevealerTransitionType.SLIDE_RIGHT;
            widget_revealer.reveal_child = true;

            widget_revealer.add (group);

            add (widget_revealer);
        }

        public void update_label_data (string read_speed, string write_speed) {
            read_label.label = "↑" + read_speed;
            write_label.label = "↓" + write_speed;
        }
    }
}
