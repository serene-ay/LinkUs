# LinkUs
LinkUS is a communication device that uses ambient computing to promote and facilitate asynchronous conversation between parents and their children who live in different countries. <br>
This set of code is for executing the full function of the physical prototype of LinkUS.

## Description and Functionality of Prototypes
1. app.py is a python script that provides RESTFUL API for push and pull data in JSON format. It also works as a webserver to serve both the webpage on http://35.201.182.206/ and http://35.201.182.206/emoji. And data is store in JSON on http://35.201.182.206/json. Any Linux server with public IP address and with Python3 installed can run this script.
2. rotate.py is a script to be run on the Raspberry Pi to function the rotation of the cylindrical disks of the physical prototype. It contains an infinite loop to pull JSON every 3 seconds.
3. home.tpl is a HTML script with Javascript functions to push data in JSON. It is the interface of the webpage application using the link http://35.201.182.206/.
4. emoji.tpl is a HTML script with Javascript functions to pull data from JSON. It is the interface of the webpage http://35.201.182.206/emoji to be shown on the screen of the physical prototype. <br>

*See below UML diagram as a visual representation of how the system works:*
![alt text](UML_Diagram.png)

## Quick start and Instruction
### Linux server with public IP address
>To install python3, see the instruction on https://docs.python.org/3/using/unix.html#on-linux. <br>
>To copy codes into the server, type command `git clone git@github.com:serene-ay/LinkUs.git`. <br>
>Then install dependency Python library by typing the following commands: <br>
>`python3 -m pip install gevent` <br>
>`python3 -m pip install bottle` <br>
>To execute app.py, type command `python3 app.py`.
### Function cylindrical disks rotation on Raspberry Pi
>To copy codes into the Raspberry Pi, type command `git clone git@github.com:serene-ay/LinkUs.git`. <br>
>Then install dependency Python library by typing following commands: <br>
>`sudo apt-get update` <br>
>`sudo apt-get install rpi.gpio` <br>
>`python3 -m pip install python-time` <br>
>`python3 -m pip install requests` <br>
>To run the script, type command `python3 rotate.py`. <br>
>Since this script contains an infinite loop, it pulls JSON every 3 seconds non-stop, to stop running the script, type command ctrl+C to exit. <br>

## Contributors
[Serene Chinglong Au-Yeung](https://github.com/serene-ay) - MSc Human Computer Interaction student <br>
[Deepika Chetan Savla](https://github.com/Dsavlaa) - MSc Human Computer Interaction student <br>
[Pratikshit Prakash](https://github.com/pratikshitp) - MSc Human Computer Interaction student <br>
[Bingzhang He](https://github.com/BingzhangHe) - MSc Human Computer Interaction student <br>
