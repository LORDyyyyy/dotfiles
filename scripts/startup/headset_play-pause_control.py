#!/bin/env python
import subprocess
import time

volume_changes = []


def get_volume():
    result = subprocess.run(
        ["pactl", "get-sink-volume", "@DEFAULT_SINK@"], capture_output=True, text=True
    )

    if result.returncode == 0:
        volume_levels = [
            int(v.strip("%")) for v in result.stdout.split() if v.endswith("%")
        ]
        return max(volume_levels) if volume_levels else None
    return None


def media_play_pause():
    subprocess.run(
        ["playerctl", "play-pause"],
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
    )


def main():
    prev_volume = get_volume()
    if prev_volume is None:
        print("Error: Unable to get volume.")
        return

    seconds_loop = 0

    while True:
        sleep_time = 0.3
        time.sleep(sleep_time)
        seconds_loop += sleep_time
        # print(volume_changes)

        current_volume = get_volume()
        if current_volume is None:
            continue

        # Clear the array after 2 seconds
        if seconds_loop >= 2:
            volume_changes.clear()
            seconds_loop = 0

        change = current_volume - prev_volume
        if change != 0:
            volume_changes.append(change)

            # Keep only the last two changes
            if len(volume_changes) > 2:
                volume_changes.pop(0)

            if (
                len(volume_changes) == 2
                and volume_changes[0] > 0
                and volume_changes[1] <= -15
                and volume_changes[1] >= -30
            ):
                media_play_pause()
                # print("detected")
                volume_changes.clear()

        prev_volume = current_volume


if __name__ == "__main__":
    main()
