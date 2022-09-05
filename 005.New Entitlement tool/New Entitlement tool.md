# New Entitlement Tool Setup Guide

BY <guangli2@cisco.com>                                                    PUBLISHED: SEP 05, 2022

---

New Entitlement Tool is a tool to compare the SN of SRs and show inventory to check if the SN is matching with show inventory information.

New Entitlement Tool which developed by python 3.x

## 1. Setup a New Entitlement Tool

To use New Entitlement Tool,prerequisite

### 1.1 Prerequisite

Download and Install Python 3.8 ,PyCharm Community ,Please select proper versions based on your OS (Window/macOS/Linux)

1. [Python 3.8](https://www.python.org/downloads/)

2. [PyCharm Community](https://www.jetbrains.com/products/compare/?product=pycharm&product=pycharm-ce)

   ![image-20220905121141669](New Entitlement tool.assets/image-20220905121141669.png) 



### 1.2 Configure a New Entitlement Tool

Import a New Entitlement Tool

1. unzip the **TACENT-master.zip**(a New Entitlement Tool)

2. import a New Entitlement Tool to PyCharm Community

   File -> Open -> Find  TACENT-master Directory

   ![image-20220905122533045](New Entitlement tool.assets/image-20220905122533045.png) 

   ![image-20220905161538597](New Entitlement tool.assets/image-20220905161538597.png)  

3. Configure Python Interpreter & Package requirements

   1. Configure Python Interpreter 

      ![image-20220905161634171](New Entitlement tool.assets/image-20220905161634171.png)     

      ![image-20220905160106423](New Entitlement tool.assets/image-20220905160106423.png) 

      Find the path of Python Interpreter which you installed

      ![image-20220905160139245](New Entitlement tool.assets/image-20220905160139245.png)

   2. Configure Package requirements

      ![image-20220905160401736](New Entitlement tool.assets/image-20220905160401736.png)  

      ![image-20220905160446898](New Entitlement tool.assets/image-20220905160446898.png) 

      ![image-20220905160523910](New Entitlement tool.assets/image-20220905160523910.png)

      Wait until Packages installed successfully

      ![img](New Entitlement tool.assets/SNAGHTML1b34959.PNG)

4. Open a TACENT-master/main_scripts/auth.py to modify the source for **username,password**

   ```python
   ==> Before
   
       username = input("CCO id: ")
       password = getpass("Password: ")
       
   ==> After
   
       username='guangli2'
       password='Bank8888*'
   ```

   Original Source

   ![image-20220905122951931](New Entitlement tool.assets/image-20220905122951931.png) 

   Update 

   ![image-20220905155704217](New Entitlement tool.assets/image-20220905155704217.png) 



## 2. Run a New Entitlement Tool

1. To run a New Entitlement Tool,Please open a input file(**main_scripts/docs/SRdoc.xlsx**) to fill SR

   ![image-20220905124512658](New Entitlement tool.assets/image-20220905124512658.png) ![image-20220905161346534](New Entitlement tool.assets/image-20220905161346534.png)

   

2. Run main_task.py(**main_scripts/main_task.py**)

   ![image-20220905124939938](New Entitlement tool.assets/image-20220905124939938.png) 

   ![image-20220905125630996](New Entitlement tool.assets/image-20220905125630996.png) 

   

   

     

   

3. Review the Output excel file(**main_scripts/docs/SROutput.xlsx**)

   ![image-20220905161243286](New Entitlement tool.assets/image-20220905161243286.png)  

 

