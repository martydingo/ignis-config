from ignis.widgets import Widget


class Bar(Widget.Window):
    def __init__(
        self,
        namespace="Bar",
        monitor=None,
        anchor=["left", "top", "right"],
        exclusivity="exclusive",
        layer="top",
        kb_mode="none",
        popup=False,
        margin_bottom=0,
        margin_left=0,
        margin_right=0,
        margin_top=0,
        dynamic_input_region=False,
        **kwargs
    ):
        super().__init__(
            namespace,
            monitor,
            anchor,
            exclusivity,
            layer,
            kb_mode,
            popup,
            margin_bottom,
            margin_left,
            margin_right,
            margin_top,
            dynamic_input_region,
            **kwargs
        )

        self.child = Widget.CenterBox(
            start_widget=Widget.Label(label="Start"),
            center_widget=Widget.Label(label="Center"),
            end_widget=Widget.Label(label="End"),
        )
