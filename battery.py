#!/usr/local/bin/python3

from subprocess import check_output

if __name__ == '__main__':
    cmd = [
            'pmset',
            '-g',
            'batt'
            ]
    out_lines = check_output(cmd).decode().split('\n')
    if out_lines[0] == "Now drawing from 'AC Power'":
        plug_state = u'\U0001F50C'
    elif out_lines[0] == "Now drawing from 'Battery Power'":
        plug_state = u'\U0001F50B'
    percent = out_lines[1][ # Slice the better percent out of the string.
            out_lines[1].find('\t')+1:out_lines[1].find(';')
            ]
    print('{}[{}]'.format(plug_state, percent))
