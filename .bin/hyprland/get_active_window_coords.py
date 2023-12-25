#!/bin/env python

import json
import os


def get_focused_window():
    with os.popen('hyprctl -j activewindow') as output:
        focused_window = json.loads(output.read())

        return focused_window
        

if __name__ == '__main__':
    window = get_focused_window()

    if window:
        x, y = window['at']
        width, height = window['size']

        print(f'{x},{y} {width}x{height}')

