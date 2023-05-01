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
