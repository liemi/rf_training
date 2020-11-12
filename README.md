# Robot Framework Training 📔

Testing target https://www.saucedemo.com/

Robot Framework test
  - Login into online store
  - Select one product
  - Complete the purchase

### Requirements

* Python 3.7 ->
* Chrome browser


### Setup
Clone repository
```
git clone https://github.com/liemi/rf_training
cd rf_training
```

Install dependencies
```
pip3 install -r requirements.txt
webdrivermanager firefox chrome --linkpath rf-env/WebDriverManager
```

Run test
```
robot saucedemo.robot
```
