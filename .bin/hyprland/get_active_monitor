#!/bin/env python

import json
import os


def get_focused_monitor():
    with os.popen('hyprctl -j monitors') as output:
        monitors = json.loads(output.read())
        focused_monitors = list(filter(lambda monitor: monitor['focused'], monitors))

        if not focused_monitors: return

        focused_monitor = focused_monitors[0]

        return focused_monitor
        

if __name__ == '__main__':
    monitor = get_focused_monitor()

    if monitor:
        print(monitor['name'])

