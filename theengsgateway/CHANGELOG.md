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
