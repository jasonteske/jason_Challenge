#!/usr/bin/python3

# Imports
import requests, smtp_server, ssl

res = requests.get('https://webserver.jasonteske.com')

#Define mail variables

port = 465  # For SSL
smtp_server = "mail.jasonteske.com"
sender_email = "me@jasonteske.com"  # Enter your address
receiver_email = "monitoring@comcast.com"  # Enter receiver address
password = input("Type your password and press enter: ")

if (res.statusCode != "200"):
  print("Site is returning invalid response")
  import smtplib, ssl

  message = """\
  Subject: jasonteske.com may be down
  jasonteske.com returned an invalid response"""
  context = ssl.create_default_context()
  with smtplib.SMTP_SSL(smtp_server, port, context=context) as server:
      server.login(sender_email, password)
      server.sendmail(sender_email, receiver_email, message)
