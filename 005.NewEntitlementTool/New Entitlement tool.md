# New Entitlement Tool Setup Guide

BY <guangli2@cisco.com>                                                    PUBLISHED: SEP 05, 2022

---

New Entitlement Tool is a tool to compare the SN of SRs and show inventory to check if the SN is matching with show inventory information.

New Entitlement Tool which developed by python 3.8

## 1. Setup a New Entitlement Tool

### 1.1 Prerequisite

Download and Install Python 3.8 ,PyCharm Community ,Please select proper versions based on your OS (Window/macOS/Linux)

1. [Python 3.8](https://www.python.org/downloads/)

2. [PyCharm Community](https://www.jetbrains.com/products/compare/?product=pycharm&product=pycharm-ce)

   ![image-20220905121141669](https://github.com/stonelee2005/myciscotool/blob/main/005.NewEntitlementTool/img/image-20220905121141669.png) 



### 1.2 Configure a New Entitlement Tool

Import a New Entitlement Tool

1. unzip the **TACENT-master.zip**(a New Entitlement Tool)

2. import a New Entitlement Tool to PyCharm Community

   File -> Open -> Find  TACENT-master Directory

   ![image-20220905122533045](https://github.com/stonelee2005/myciscotool/blob/main/005.NewEntitlementTool/img/image-20220905122533045.png) 

   ![image-20220905161538597](https://github.com/stonelee2005/myciscotool/blob/main/005.NewEntitlementTool/img/image-20220905161538597.png)  

3. Configure Python Interpreter & Package requirements

   1. Configure Python Interpreter 

      ![image-20220905161634171](https://github.com/stonelee2005/myciscotool/blob/main/005.NewEntitlementTool/img/image-20220905161634171.png)     

      ![image-20220905160106423](https://github.com/stonelee2005/myciscotool/blob/main/005.NewEntitlementTool/img/image-20220905160106423.png) 

      Find the path of Python Interpreter which you installed

      ![image-20220905160139245](https://github.com/stonelee2005/myciscotool/blob/main/005.NewEntitlementTool/img/image-20220905160139245.png)

   2. Configure Package requirements

      ![image-20220905162429659](https://github.com/stonelee2005/myciscotool/blob/main/005.NewEntitlementTool/img/image-20220905162429659.png)  

      ![image-20220905162459845](https://github.com/stonelee2005/myciscotool/blob/main/005.NewEntitlementTool/img/image-20220905162459845.png)  

      Wait until Packages installed successfully

      ![img](https://github.com/stonelee2005/myciscotool/blob/main/005.NewEntitlementTool/img/SNAGHTML1c53220.PNG)

4. Open a TACENT-master/main_scripts/auth.py to modify the source with your **username,password**

   ```python
   ==> Before
   
       username = input("CCO id: ")
       password = getpass("Password: ")
       
   ==> After
   
       username='guangli2'
       password='Bank8888*'
   ```

   Original Source

   ![image-20220905122951931](https://github.com/stonelee2005/myciscotool/blob/main/005.NewEntitlementTool/img/image-20220905122951931.png) 

   Update 

   ![image-20220905155704217](https://github.com/stonelee2005/myciscotool/blob/main/005.NewEntitlementTool/img/image-20220905155704217.png) 



## 2. Run a New Entitlement Tool

1. To run a New Entitlement Tool,Please open a input file(**main_scripts/docs/SRdoc.xlsx**) to fill SR

   ![image-20220905124512658](https://github.com/stonelee2005/myciscotool/blob/main/005.NewEntitlementTool/img/image-20220905124512658.png) ![image-20220905161346534](https://github.com/stonelee2005/myciscotool/blob/main/005.NewEntitlementTool/img/image-20220905161346534.png)

   

2. Run main_task.py(**main_scripts/main_task.py**)

   ![image-20220905124939938](https://github.com/stonelee2005/myciscotool/blob/main/005.NewEntitlementTool/img/image-20220905124939938.png) 

   ![image-20220905125630996](https://github.com/stonelee2005/myciscotool/blob/main/005.NewEntitlementTool/img/image-20220905125630996.png) 

3. Review the Output excel file(**main_scripts/docs/SROutput.xlsx**)

   ![image-20220905161243286](https://github.com/stonelee2005/myciscotool/blob/main/005.NewEntitlementTool/img/image-20220905161243286.png)  

 

