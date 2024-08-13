## [1.11.1]
###BREAKING CHANGE:
--time_between as float & argument adjustments by @DigiH in [#236](https://github.com/theengs/gateway/pull/236)
See the documentation at https://gateway.theengs.io/use/use.html#details-options

### NEW FEATURE:
Whitelist and Blacklist implementation by @johannes-z in [#257](https://github.com/theengs/gateway/pull/257)

### What's Changed
model_id included in tracker dict by @DigiH in [#237](https://github.com/theengs/gateway/pull/237)
Add option -ti/--tls_insecure to not check certificate hostname by @mcesar-rlacruz in [#244](https://github.com/theengs/gateway/pull/244)
Remove discovery filter remnants at startup by @DigiH in [#248](https://github.com/theengs/gateway/pull/248)
fix mqtt reason_code is not an int by @Mips2648 in [#252](https://github.com/theengs/gateway/pull/252)
[DISC] Additional discovery device classes by @DigiH in [#253](https://github.com/theengs/gateway/pull/253)
Whitelist and Blacklist implementation by @johannes-z in [#257](https://github.com/theengs/gateway/pull/257)
White/blacklist fix by @DigiH in [#258](https://github.com/theengs/gateway/pull/258)
Bump TheengsDecoder to 178 by @DigiH in [#259](https://github.com/theengs/gateway/pull/259)

###New devices
|Devices|Model|Measurements|
|-|:-:|:-:|
| Gigaset |G-Tag|device tracker|
| Mobvoi |TicWatch GTH (Pro)|device tracker|
| Jaalee |F51C|temperature, humidity, battery|
| XOSS |X2 heart rate sensor|heart rate, battery|
| NodOn |NIU smart button|button press type, color, battery|
| Govee |H5105|temperature, humidity, battery|
| Feasycom |Bluetooth Beacons|beacon model, battery, plugged-in|
| Otodata |RC1010|level, status, serial, model type|
| Amphiro/Oras/Hansa |Faucet|serial number, battery|
| Tilt |Brewing Hydro- Thermometer|color, temperature, specific gravity, txpower @ 1 m|
| SwitchBot |Blind Tilt|open, direction, motion, calibrated, light level, battery|

**Full Changelog**: https://github.com/theengs/gateway/compare/v1.4.0...v1.5.0

## [1.11.0]
### What's Changed
* Don't spam log with full stack trace when bindkey not found by @koenvervloesem in https://github.com/theengs/gateway/pull/228
* [DOCS] Add installation instructions in Python venv by @koenvervloesem in https://github.com/theengs/gateway/pull/229
* [DOCS] Add Identities IRK example for docker by @1technophile in https://github.com/theengs/gateway/pull/230
* [DOCS] Add instructions for systemd service by @koenvervloesem in https://github.com/theengs/gateway/pull/231
* Tracker only discovery fix by @DigiH in https://github.com/theengs/gateway/pull/232
* General Presence implementation by @DigiH in https://github.com/theengs/gateway/pull/233
* Migrate to Paho MQTT 2.0 by @koenvervloesem in https://github.com/theengs/gateway/pull/234

**Full Changelog**: https://github.com/theengs/gateway/compare/v1.3.0...v1.4.0

## [1.10.0]
### What's Changed
This release is focused on **presence detection**. We can now detect the presence and absence of trackers devices like TILE, NUT, BlueCharm (and other models identified [here](https://decoder.theengs.io/devices/devices.html), the gateway will publish an offline message after tracker_timeout (120s per default) to set your controller to "Away" status.
Added to this, Apple Watch, iPhone, and iPad can be used for presence detection with the usage of their IRK.
And of course numerous other enhancements detailed below, thanks @DigiH and @koenvervloesem !

### New devices
|Devices|Model|Measurements|
|-|:-:|:-:|
| ClearGrass/Qingping |CGP23W|temperature, humidity, atmospheric pressure, battery|
| Aranet4 |CO₂ Monitor|temperature, humidity, pressure, carbon dioxide, battery|
| Switchbot|Curtain model 3|moving, position, light level, battery, calibration state|

### New features
* prmac implementation by @DigiH in https://github.com/theengs/gateway/pull/187
* Apple devices Identity Address and IRK instructions by @DigiH in https://github.com/theengs/gateway/pull/190
* [DISC] HA discovery lock class added by @DigiH in https://github.com/theengs/gateway/pull/191
* Add option to disable BLE by @koenvervloesem in https://github.com/theengs/gateway/pull/196
* [DISC] device_tracker discovery by @DigiH in https://github.com/theengs/gateway/pull/213
* [DISC] device tracker discovery value_template to rssi by @DigiH in https://github.com/theengs/gateway/pull/215
* [DISC] Isolate "track" advanced property publishing by @DigiH in https://github.com/theengs/gateway/pull/217
* [DISC] Timeout for discovered device trackers by @DigiH in https://github.com/theengs/gateway/pull/219

### Miscelleanous
* Process undecoded messages from MQTT the same way as from BLE by @koenvervloesem in https://github.com/theengs/gateway/pull/192
* Show command-line options alphabetically by @koenvervloesem in https://github.com/theengs/gateway/pull/195
* Show version in --help output by @koenvervloesem in https://github.com/theengs/gateway/pull/198
* Update Ruff version and use ruff-format instead of black formatter by @koenvervloesem in https://github.com/theengs/gateway/pull/199
* Fix undecoded servicedata by @DigiH in https://github.com/theengs/gateway/pull/204
* Fix TypeError for None values in diagnostics by @koenvervloesem in https://github.com/theengs/gateway/pull/206
* Don't crash when receiving JSON message without id by @koenvervloesem in https://github.com/theengs/gateway/pull/223
* Apple devices only unlocked fix by @DigiH in https://github.com/theengs/gateway/pull/221

### Documentation
* [DOCS] Remove devices page as now generated by the decoder by @1technophile in https://github.com/theengs/gateway/pull/185
* [DOCS] pip upgrade addition by @koenvervloesem in https://github.com/theengs/gateway/pull/194
* [DOCS] Passive scanning path clarification by @DigiH in https://github.com/theengs/gateway/pull/200
* [DOC]S General documentation fixes, using Vale's Google style guide by @koenvervloesem in https://github.com/theengs/gateway/pull/211
* [DOCS] Further documentation fixes by enabling Google style suggestions by @koenvervloesem in https://github.com/theengs/gateway/pull/212
* [DOCS] Factorize configuration by @1technophile in https://github.com/theengs/gateway/pull/218
* [DOCS] Add IRK screenshot by @1technophile in https://github.com/theengs/gateway/pull/224

### CI
* [CI] Run pre-commit on all files by @koenvervloesem in https://github.com/theengs/gateway/pull/214
* [CI] Ignore Ruff rules conflicting with formatter by @koenvervloesem in https://github.com/theengs/gateway/pull/209
* [CI] Run Vale in pre-commit to spellcheck documentation by @koenvervloesem in https://github.com/theengs/gateway/pull/210
* [CI] Run checks also on Python 3.12 by @koenvervloesem in https://github.com/theengs/gateway/pull/197
* [CI] Test build of Python package on all Python versions for every PR by @koenvervloesem in https://github.com/theengs/gateway/pull/201
* [CI] Update Vale to 3.0.4 by @koenvervloesem in https://github.com/theengs/gateway/pull/220
* [CI] Relax McCabe complexity limit to 15 by @koenvervloesem in https://github.com/theengs/gateway/pull/222

**Full Changelog**: https://github.com/theengs/gateway/compare/v1.2.0...v1.3.0

## [1.9.0]
### What's Changed
On top of numerous new devices supported, this version brings exciting features like the support of encrypted advertisements, the capability to resolve private BLE addresses, HA MQTT discovery tuning, and TLS/Websockets support. Let's dive in!

### New devices
|Devices|Model|Measurements|
|-|:-:|:-:|
| April Brother|N07|temperature/humidity/battery/packet ID|
| BM6 Battery Monitor|BM6|battery|
| GOVEE|H5100|temperature/humidity/battery|
| GOVEE|H5104|temperature/humidity/battery|
| GOVEE|H5179|temperature/humidity/battery|
| INKBIRD|IBS-TH12S|temperature/humidity/battery|
| NUT | NUTALE | tracker |
| Oral B| Toothbrush| state, mode, sector, pressure, time|
| Lippert|BottleCheck|temperature/level/sync status/voltage/battery/reading quality/acceleration x/y-axis|
| ShellyBlu|Button1|button press type/battery/packet ID|
| ShellyBlu|Door/Window|contact/rotation/battery/packet ID|
| ShellyBlu|Motion|motion, illuminance, battery, packet ID|
| ThermoPro|TP357s|temperature/humidity|

### New features
* Add support for ShellyBLU Button1 encrypted advertisements by @koenvervloesem in https://github.com/theengs/gateway/pull/145
* Add -c option to choose path for configuration file by @koenvervloesem in https://github.com/theengs/gateway/pull/143
* Add support for encrypted PVVX advertisements by @koenvervloesem in https://github.com/theengs/gateway/pull/146
* Publish encrypted properties when PUBLISH_ADVDATA is 1 by @koenvervloesem in https://github.com/theengs/gateway/pull/150
* Add support for decrypting ShellyBLU Door/Window advertisements by @koenvervloesem in https://github.com/theengs/gateway/pull/153
* Decode advertisement with service data for each UUID separately by @koenvervloesem in https://github.com/theengs/gateway/pull/154
* Simplify decoding of advertisements by @koenvervloesem in https://github.com/theengs/gateway/pull/157
* Simplify configuration and arguments merging by @koenvervloesem in https://github.com/theengs/gateway/pull/158
* feat/websockets-ssl by @radim-kliment in https://github.com/theengs/gateway/pull/160
* Document TLS and WebSocket options by @koenvervloesem in https://github.com/theengs/gateway/pull/161
* Support encrypted ShellyBLU Motion advertisements by @koenvervloesem in https://github.com/theengs/gateway/pull/172
* Resolve private addresses for known IRKs by @koenvervloesem in https://github.com/theengs/gateway/pull/173
* Update encryption code to Decoder 1.6.2 by @koenvervloesem in https://github.com/theengs/gateway/pull/176
* [DISC] HA discovery device classes and units additions by @DigiH in https://github.com/theengs/gateway/pull/177

### Miscelleanous
* Stop scan loop and show error message on BleakError by @koenvervloesem in https://github.com/theengs/gateway/pull/179
* [DISC] Align discovery by @1technophile in https://github.com/theengs/gateway/pull/183
* Clean up configuration code by @koenvervloesem in https://github.com/theengs/gateway/pull/162
* Fix typo preventing startup by @kw217 in https://github.com/theengs/gateway/pull/169
* Clean up code with newly activated Ruff rules by @koenvervloesem in https://github.com/theengs/gateway/pull/156
* Bump Theengs Decoder to v1.6.4  by @1technophile in https://github.com/theengs/gateway/pull/184

### Documentation
- [DOCS] Add H1 title by @1technophile in https://github.com/theengs/gateway/pull/164
- [DOCS] Add compatible list by @1technophile in https://github.com/theengs/gateway/pull/140
- [DOCS] Clarify support of non-Linux platforms by @koenvervloesem in https://github.com/theengs/gateway/pull/155
- [DOCS] Remove new icon by @1technophile in https://github.com/theengs/gateway/pull/141
- [DOCS] Fix typo in docs by @jcherniak in https://github.com/theengs/gateway/pull/147

### CI
* [CI] Enable all Ruff rules by @koenvervloesem in https://github.com/theengs/gateway/pull/163
* [CI] Update GitHub actions by @koenvervloesem in https://github.com/theengs/gateway/pull/151
* Update pre-commit configuration and fix newly found issues by @koenvervloesem in https://github.com/theengs/gateway/pull/165
* [CI] Run pre-commit checks on all supported Python versions by @koenvervloesem in https://github.com/theengs/gateway/pull/170
* Automatic versioning from Git metadata by @koenvervloesem in https://github.com/theengs/gateway/pull/149

### New Contributors
* @jcherniak made their first contribution in https://github.com/theengs/gateway/pull/147
* @radim-kliment made their first contribution in https://github.com/theengs/gateway/pull/160
* @kw217 made their first contribution in https://github.com/theengs/gateway/pull/169

**Full Changelog**: https://github.com/theengs/gateway/compare/v1.1.0...v1.2.0

## [1.8.0]
## What's Changed
* Docstring fixes by @koenvervloesem in https://github.com/theengs/gateway/pull/133
* Add typing annotations by @koenvervloesem in https://github.com/theengs/gateway/pull/134
* Clean up exceptions by @koenvervloesem in https://github.com/theengs/gateway/pull/135
* [TD] Update TheengsDecoder requirement version to 1.4.2 by @DigiH in https://github.com/theengs/gateway/pull/136
* [DOCS] Add web parser by @1technophile in https://github.com/theengs/gateway/pull/137
* Only log number of published messages at INFO level by @koenvervloesem in https://github.com/theengs/gateway/pull/138
* Bump TheengsDecoder to 150 by @1technophile in https://github.com/theengs/gateway/pull/139
* Mopeka acceleration x/y-axis added by @DigiH in Mopeka acceleration x/y-axis added decoder#340
* SBBT-002C: document periodic beacon by @koenvervloesem in SBBT-002C: document periodic beacon decoder#345
* Fix SBBT-002C decoder to detect new firmware by @koenvervloesem in Fix SBBT-002C decoder to detect new firmware decoder#346
* KKM K6P & K9 Beacons by @DigiH in KKM K6P & K9 Beacons decoder#347
* Govee H5106 humidity decimal by @DigiH in Govee H5106 humidity decimal decoder#348
* BlueCharm temperature fix by @DigiH in BlueCharm temperature fix decoder#349
* Decoder for ShellyBLU Button1 by @koenvervloesem in Decoder for ShellyBLU Button1 decoder#337

## [1.7.0]
## What's Changed
* Fix diagnose and run diagnostics when log level is DEBUG by @koenvervloesem in https://github.com/theengs/gateway/pull/122
* Add APPLE_CONT and APPLE_CONTAT to default discovery filter by @koenvervloesem in https://github.com/theengs/gateway/pull/123
* Run ruff and mypy in pre-commit by @koenvervloesem in https://github.com/theengs/gateway/pull/125
* Add publish_advdata option by @koenvervloesem in https://github.com/theengs/gateway/pull/127
* [RMAC] Filter random mac devices by @1technophile in https://github.com/theengs/gateway/pull/128
* [TD] Update TheengsDecoder requirement version to 1.4.0 by @1technophile in https://github.com/theengs/gateway/pull/129
* [RMAC] Remove unnecessary filters by @1technophile in https://github.com/theengs/gateway/pull/130

## [1.6.1]
## What's Changed
* Filter APPLE_CONT devices by @1technophile in https://github.com/mihsu81/addon-theengsgw/pull/23

## [1.6.0]
## What's Changed
* Add mfr key with company name based on company ID by @koenvervloesem in https://github.com/theengs/gateway/pull/95
* Fix not being able to set publish_all to 0 by @koenvervloesem in https://github.com/theengs/gateway/pull/96
* Use UTF-8 encoding to read long description in setup.py by @koenvervloesem in https://github.com/theengs/gateway/pull/98
* The main loop should not run in the same scope as __init__ by @BlackLight in https://github.com/theengs/gateway/pull/101
* Added presence detection by @toomyem in https://github.com/theengs/gateway/pull/106
* Added LWT message handling by @toomyem in https://github.com/theengs/gateway/pull/108
* [DOCS] Add use cases links by @1technophile in https://github.com/theengs/gateway/pull/111
* Replace deprecated BLEDevice.rssi by AdvertisementData.rssi by @koenvervloesem in https://github.com/theengs/gateway/pull/114
* Use TheengsDecoder package instead of submodule by @koenvervloesem in https://github.com/theengs/gateway/pull/112
* Add diagnose module for troubleshooting by @koenvervloesem in https://github.com/theengs/gateway/pull/116
* [DIAG] Fix requirement for windows by @1technophile in https://github.com/theengs/gateway/pull/117

New BLE devices support:
|Devices|Model|Measurements|
|-|:-:|:-:|
| Polar|H10|heart rate|
| Atomax|Skale|weight|

## [1.5.0]
## What's Changed
* Generalized time synchronization support for more clocks by @koenvervloesem in https://github.com/theengs/gateway/pull/91
* [CI] Fix poetry error on isort by @1technophile in https://github.com/theengs/gateway/pull/94
* Bump TheengsDecoder to 1.1.0 by @1technophile in https://github.com/theengs/gateway/pull/93
* LYWSD03MMC negative temp fix by @DigiH in https://github.com/theengs/decoder/pull/269
* MHO-C401 fix by @DigiH in https://github.com/theengs/decoder/pull/259
* MAC model condition introduction by @DigiH in https://github.com/theengs/decoder/pull/263
* SwitchBot Curtain fix by @DigiH in https://github.com/theengs/decoder/pull/268

New BLE devices support:
|Devices|Model|Measurements|
|-|:-:|:-:|
| BlueCharm|BC08|acceleration x/y/z-axis/voltage/temperature|
| Jaalee|JHT F525|temperature/humidity/battery|

**Full Changelog**: https://github.com/theengs/gateway/compare/v0.7.0...v0.8.0

## [1.4.0]
More than 10 new devices supported !

## What's Changed
- Disable duplicate detection of advertisement data on Linux by @koenvervloesem in #85
- Bump Theengs Decoder to v1.0.0 by @1technophile in #89

## New BLE devices and changes:
|Devices|Model|Measurements|
|-|:-:|:-:|
| BlueMaestro|TempoDisc 1 in 1|temperature/battery|
| BlueMaestro|TempoDisc 4 in 1|temperature/humidity/pressure/battery|
| ClearGrass alarm clock|CGD1|temperature/humidity/**battery**|
| ClearGrass alarm clock|CGC1|temperature/humidity/battery|
| GOVEE|H5074|temperature/humidity/battery|
| GOVEE|H5101|temperature/humidity/battery|
| GOVEE|[H5106](https://compatible.openmqttgateway.com/index.php/product/govee-h5106-pm25-temperature-humidity/)|PM2.5/temperature/humidity/battery|
| GOVEE|H5174|temperature/humidity/battery|
| GOVEE|H5177|temperature/humidity/battery|
| Oria/Brifit/SigmaWit/SensorPro|TH Sensor T301|temperature/humidity/battery|
| Mopeka|[Pro](https://compatible.openmqttgateway.com/index.php/product/mopeka-tank-pro-sensor-with-magnets-for-steel-lp-tanks/)|temperature/level/sync status/voltage/battery/reading quality|
| Sensirion|MyCO₂/CO₂ Gadget|temperature/humidity/carbon dioxide|
| Sensirion|SHT4X TH sensor|temperature/humidity|
| ThermoPro|TP393|temperature/humidity|

## [1.3.2]
Small maintenance release to fix a [bug](https://github.com/theengs/gateway/pull/84) when installing.

## [1.3.1]
Small maintenance release to align the decoder version between OpenMQTTGateway, the gateway and the app, and some minor changes.
## What's Changed
- [DOCS] Add discovery options to docker use by @1technophile in #69
- Improve install instructions by @1technophile in #70
- Add more space for the device table by @1technophile in #72
- Correct timezone offset for LYWSD02 time synchronization by @koenvervloesem in #71
- Add shop link by @1technophile in #74
- Fix typo in passive scanning docs: daemon-reload by @koenvervloesem in #76
- Extend docs for building from source by @koenvervloesem in #80
- Bump TheengsDecoder to v0.9.7 by @1technophile in #82, contains one breaking change about the IBS-TH1
- Code style cleanup with black, flake8 and isort by @koenvervloesem in #77

## [1.3.0]
A big release for Theengs Gateway, @DigiH did a huge work adding new devices and improving the existing ones!

Also, the TheengsGateway auto discovery following HA convention can be compatible now with other controllers like OpenHAB thanks to the work of @koenvervloesem #62 , just set `hass_discovery` to 0 if you use [OpenHAB](https://www.openhab.org/) or other Home Controllers.

I added documentation to the Theengs satellite/proxy feature that was available in the previous release. If you use OpenMQTTGateway [web upload](https://docs.openmqttgateway.com/upload/web-install.html) binary `esp32dev-ble-mqtt-undecoded` that will publish directly to `home/<gateway name>/BTtoMQTT/undecoded` making it directly compatible with Theengs Gateway MQTTtoMQTT decoding feature. In short, you can have satellites ESP32 sending undecoded data to TheengsGateway, and TheengsGateway centralizing the decoding work.

## What's Changed
- Add direct my home assistant link to doc by @1technophile in https://github.com/mihsu81/addon-theengsgw/pull/11
- Change default subscribe topic by @1technophile in https://github.com/mihsu81/addon-theengsgw/pull/12
- Undecoded default subscribe by @1technophile in https://github.com/theengs/gateway/pull/68
- Add docker doc by @1technophile in https://github.com/theengs/gateway/pull/60
- Bump TheengsDecoder to v0.9.0 by @1technophile in https://github.com/theengs/gateway/pull/61
- Add option to enable or disable Home Assistant-specific discovery by @koenvervloesem in https://github.com/theengs/gateway/pull/62
- [DOCS] Add link to My HA and reorganize install and use docs by @1technophile in https://github.com/theengs/gateway/pull/64
- Replace deprecated BleakScanner.register_detection_callback() by @koenvervloesem in https://github.com/theengs/gateway/pull/63
- Bump Theengs Decoder to v095 by @1technophile in https://github.com/theengs/gateway/pull/66
- Amphiro/Oras Digital Shower Head by @DigiH in https://github.com/theengs/decoder/pull/195
- ThermoPro TP357 & TP358 by @DigiH in https://github.com/theengs/decoder/pull/198
- Oria T301 by @DigiH in https://github.com/theengs/decoder/pull/199
- CGPR1 enhancements by @DigiH in https://github.com/theengs/decoder/pull/200
- Unit adjustments CGP1W & TPMS by @DigiH in https://github.com/theengs/decoder/pull/201
- Ohm to Ω by @DigiH in https://github.com/theengs/decoder/pull/202
- string_from_hex_data clarification by @DigiH in https://github.com/theengs/decoder/pull/203
- Acceleration adjustments by @DigiH in https://github.com/theengs/decoder/pull/204
- SmartDry shake changes by @DigiH in https://github.com/theengs/decoder/pull/206

New devices and **changes**:
|Devices|Model|Measurements|
|-|:-:|:-:|
| ClearGrass|CGG1|**multi firmware support** PVVX-ATC|
| Hydractiva Digital | Amphiro/Oras|sessions/time/litres/temperature/energy|
| Oria/Brifit/SigmaWit/SensorPro|TH Sensor|temperature/humidity/battery|
| Qingping|CGPR1|presence/luminance/**battery**|
| ThermoPro|TP357|temperature/humidity|
| ThermoPro|TP358|temperature/humidity|
| ThermoPro|TP359|temperature/humidity|
| Otio/BeeWi|Door & Window Sensor|contact/battery|

**Full Changelog**: https://github.com/mihsu81/addon-theengsgw/compare/v1.2.0...v1.3.0

## [1.2.0] - 2022-09-14

## What's Changed
Update TGW to v0.5.0 and include scanning_mode.

**Full Changelog**: https://github.com/mihsu81/addon-theengsgw/compare/v1.1.0...v1.2.0
