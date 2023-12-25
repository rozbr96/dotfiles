#!/bin/env python

import json
import os


def get_focused_monitor_name():
    with os.popen('hyprctl -j activeworkspace') as output:
        workspace = json.loads(output.read())

        focused_monitor = workspace['monitor']

        return focused_monitor
        

if __name__ == '__main__':
    monitor_name = get_focused_monitor_name()

    if monitor_name:
        print(monitor_name)

