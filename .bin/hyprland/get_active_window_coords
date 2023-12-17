#!/bin/env python

import json
import os


def get_focused_window():
    with os.popen('hyprctl -j clients') as output:
        windows = json.loads(output.read())
        focused_windows = list(filter(lambda window: window['focusHistoryID'] == 0, windows))

        if not focused_windows: return

        focused_window = focused_windows[0]

        return focused_window
        

if __name__ == '__main__':
    window = get_focused_window()

    if window:
        x, y = window['at']
        width, height = window['size']

        print(f'{x},{y} {width}x{height}')

