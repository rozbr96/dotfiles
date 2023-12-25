#!/bin/env python

import os
import json

from typing import List


def get_windows() -> List[dict]:
    with os.popen('hyprctl -j clients') as output:
        windows = json.loads(output.read())

        return windows


def is_valid_window(window: dict) -> bool:
    if not window['title']: return False
    if 'special' in window['workspace']['name']: return False

    return True


if __name__ == '__main__':
    windows = get_windows()
    valid_windows = filter(is_valid_window, windows)
    windows_titles = map(lambda w: w['title'], valid_windows)

    print('\n'.join(windows_titles))
