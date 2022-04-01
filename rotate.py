#!/usr/bin/env python3

# Import libraries
import RPi.GPIO as GPIO
import time
# import requests module
import requests
import sys

# Making a get response
response = requests.get('http://35.201.182.206/json')
# Get the previous location & activity
previous_event = response.json()["event"][9]
print("set previous activity: ",previous_event["message"])
print("set previous location: ",previous_event["location"])
previous_activity = previous_event["message"]
previous_location = previous_event["location"]

# Set GPIO numbering mode
GPIO.setmode(GPIO.BOARD)

# Set pin 11, 35 & 15 as outputs, and define as PWM servo1, servo2 & servo3
GPIO.setup(11,GPIO.OUT)
servo1 = GPIO.PWM(11,50) # pin 11 for servo1, servo1 is connected to time graphics cog

GPIO.setup(35,GPIO.OUT)
servo2 = GPIO.PWM(35,50) # pin 35 for servo2, servo2 is connected to location graphics cog

GPIO.setup(15,GPIO.OUT)
servo3 = GPIO.PWM(15,50) # pin 15 for servo3, servo3 is connected to activity graphics cog

# Start PWM running on all servos, value of 0 (pulse off)
servo1.start(0)
servo2.start(0)
servo3.start(0)

# set servo to rotate 360 degrees
pin = 35
dutyCycle = 1
timeOn = 0.5
zeroCycle = 5  # 7.5
timeOff = 2


if len(sys.argv) > 1: pin = int(sys.argv[1])
if len(sys.argv) > 2: dutyCycle = float(sys.argv[2])
if len(sys.argv) > 3: timeOn = float(sys.argv[3])
if len(sys.argv) > 4: zeroCycle = float(sys.argv[4])
if len(sys.argv) > 5: timeOff = float(sys.argv[5])

# set function to rotate activites graphics
def changeActivity(counter):
  for i in range(counter):
    servo3.ChangeDutyCycle(dutyCycle)
    time.sleep(timeOn)
    servo3.ChangeDutyCycle(zeroCycle)
    time.sleep(timeOff)
    servo3.ChangeDutyCycle(0)

# set function to rotate locations graphics
def changeLocation(counter):
  for i in range(counter):
    servo2.ChangeDutyCycle(dutyCycle)
    time.sleep(timeOn)
    servo2.ChangeDutyCycle(zeroCycle)
    time.sleep(timeOff)
    servo2.ChangeDutyCycle(0)


#infinite loop that get json every 3 seconds to track latest status
while True:
    response = requests.get('http://35.201.182.206/json')
    #get the latest status
    latest_event = response.json()["event"][9]
    print("2. latest activity: ",latest_event["message"])
    print("latest location: ",latest_event["location"])
    #set activity & location as the latest status
    activity = latest_event["message"]
    location = latest_event["location"]

    # Position of the physical loaction graphics: home > university > store > part > one counter blank section
    # Position of the physical activity graphics: eat > study > sleep > walk > one counter blank section
    # Each section of graphics takes 2 counters
    # A whole rotation takes 9 counters

    if latest_event != previous_event:
        print("3. ", previous_activity)
        print("4. ", activity)
        print("motor will run")
        # Below functions are written base on 12 posibilities of rotation situation
        if activity == "eat":
          if previous_activity == "study":
            print("turn 8 section")
            changeActivity(8) 
          elif previous_activity == "sleep":
            print("turn 7 section")
            changeActivity(7) 
          elif previous_activity == "walk":
            print("turn 6 section")
            changeActivity(6) 
        elif activity == "walk":
          if previous_activity == "eat":
            print("turn 3 section")
            changeActivity(3) 
          elif previous_activity == "study":
            print("turn 2 section")
            changeActivity(2) 
          elif previous_activity == "sleep":
            print("turn 1 section")
            changeActivity(1) 
        elif activity == "sleep":
          if previous_activity == "walk":
            print("turn 8 section")
            changeActivity(8) 
          elif previous_activity == "eat":
            print("turn 2 section")
            changeActivity(2) 
          elif previous_activity == "study":
            print("turn 1 section")
            changeActivity(1) 
        elif activity == "study":
          if previous_activity == "sleep":
            print("turn 8 section")
            changeActivity(8) 
          elif previous_activity == "walk":
            print("turn 7 section")
            changeActivity(7) 
          elif previous_activity == "eat":
            print("turn 1 section")
            changeActivity(1) 


        # Below functions are written base on 12 posibilities of rotation situation
        if location == "home":
          if previous_location == "university":
            changeLocation(8) 
          elif previous_location == "shop":
            changeLocation(7) 
          elif previous_location == "park":
            changeLocation(6) 
        elif location == "park":
          if previous_location == "home":
            changeLocation(3) 
          elif previous_location == "university":
            changeLocation(2) 
          elif previous_location == "shop":
            changeLocation(1) 
        elif location == "shop":
          if previous_location == "park":
            changeLocation(8) 
          elif previous_location == "home":
            changeLocation(2) 
          elif previous_location == "university":
            changeLocation(1) 
        elif location == "university":
          if previous_location == "shop":
            changeLocation(8) 
          elif previous_location == "park":
            changeLocation(7) 
          elif previous_location == "home":
            changeLocation(1) 


    # Set current status back to previous status after function had been ran    
    previous_event = latest_event
    previous_activity = previous_event["message"]
    previous_location = previous_event["location"]

    time.sleep(3)

