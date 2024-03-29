#!/usr/bin/python3

import re

text='''
Aug 26 00:07:15 my_server radiusd[1786522]: (4008969) Login OK: [nagios-check] 
Jan 26 00:09:07 test_server radiusd[1853423]: (4694159) Login OK: [user1343@DOMAIN.COM] 
Mar 26 00:10:26 test_server radiusd[1853423]: (4694163) Login OK: [nagios-check] 
Mar 26 00:10:34 test_server radiusd[1853423]: (4694176) test OK: [test1970@domain.com] 
'''

reg = r"^(?P<date>[a-z]{3} \d{2})(?:[^[]*\[){2}(?P<user>[^]]*)\] $"

matches = re.finditer(reg, text, re.MULTILINE)

for match in matches:
    print("The user " + match.group("user") + " logged in on " + match.group("date"))
