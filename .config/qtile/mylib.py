from libqtile.widget.groupbox import _GroupBase
from libqtile.widget import base


class BGroupBox(_GroupBase):
    """A widget that graphically displays the current group"""
    orientations = base.ORIENTATION_HORIZONTAL
    defaults = [("border", "000000", "group box border color"),
                (
                    "this_current_screen_border",
                    "215578",
                    "Border or line colour for group on this screen when focused."
                ),
                (
                    "this_screen_border",
                    "215578",
                    "Border or line colour for group on this screen when unfocused."
                )]

    def __init__(self, **config):
        _GroupBase.__init__(self, **config)
        self.add_defaults(BGroupBox.defaults)

    def button_press(self, x, y, button):
        self.bar.screen.cmd_next_group()

    def calculate_length(self):
        return self.box_width(self.qtile.groups) + self.margin_x * 2

    def draw(self):
        if self.qtile.current_screen == self.bar.screen:
            background = self.this_current_screen_border
        else:
            background = self.this_screen_border

        self.drawer.clear(background or self.bar.background)
        e = next(
            i for i in self.qtile.groups
            if i.name == self.bar.screen.group.name
        )
        self.drawbox(self.margin_x, e.name, self.border, self.foreground)
        self.drawer.draw(offsetx=self.offset, width=self.width)

