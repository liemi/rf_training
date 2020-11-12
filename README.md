# Robot Framework Training 📔

Testing target https://www.saucedemo.com/

Robot Framework test
  - Login into online store
  - Select one product
  - Complete the purchase

### Requirements

* Python 3.7 ->
* Chrome browser

Clone repository
```
git clone https://github.com/liemi/rf_training
cd rf_training
```

### Virtual Enviroment
Install virtualenv
```
pip3 install virtualenv
```
Create enviroment
```
virtualenv rf-env
```

### Setup
Install dependencies
```
pip3 install -r requirements.txt
webdrivermanager chrome
```
Run test
```
robot saucedemo.robot
```
