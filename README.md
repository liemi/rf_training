# Robot Framework Training 📔

Testaus kohde https://www.saucedemo.com/

Robot Framework testaus tekee seuraavasti
  - Kirjautuu sisään verkkokauppaan
  - Valitsee yhden tuotteen
  - Vie ostotapahtuman loppuun

### Vaatimukset

* Python 3.7 ->
* Chrome-selain

### Setup
Clone repository
```
git clone https://github.com/liemi/rf_training
cd rf_training
```
Asenna riippuvuudet
```
pip3 install -r requirements.txt
webdrivermanager chrome
```
Aja testi
```
robot saucedemo.robot
```
