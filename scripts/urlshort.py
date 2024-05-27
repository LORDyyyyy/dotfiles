#!/usr/bin/python
"""
    By Mohammed Reda
    https://github.com/JAMmIKA1?tab=overview&from=2024-05-01&to=2024-05-27
"""


import pyshorteners
import sys
import pyperclip

first = True
short_url = ''

if len(sys.argv) == 1:
    link = input('Enter the link: ')
    long_url = str(link)
    stype = pyshorteners.Shortener()
    short_url = stype.tinyurl.short(long_url)
    print(f'\n{short_url}')
else:
    for arg in sys.argv:
        if (first):
            first = False
            continue
        long_url = str(arg)
        stype = pyshorteners.Shortener()
        short_url = stype.tinyurl.short(long_url)
        print(f'\n{short_url}')

pyperclip.copy(short_url)
print("\nThe link has been copied to your clipboard!\n")
