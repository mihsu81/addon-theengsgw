# Installation and Configuration

1. Open Home Assistant and navigate to the "Add-on Store". Click on the 3 dots (top right) and select "Repositories".
2. Enter `https://github.com/mihsu81/addon-theengsgw` in the box and click on "Add".
3. You should now see "TheengsGateway HA Add-on" at the bottom list.
4. Click on "TheengsGateway", then click "Install".
5. Under the "Configuration" tab, change the settings appropriately (at least MQTT parameters), see [Parameters](#parameters).
6. Start the Add-on.

## Parameters
Option | Type | Required | Description
--- | --- | --- | ---
MQTT_HOST | string | Yes | MQTT host address, i.e. the IP/hostname of your Moquitto Broker Add-on
MQTT_USERNAME | string | Yes | MQTT username
MQTT_PASSWORD | string | Yes | MQTT password
MQTT_PORT | integer | Yes | MQTT host port, defaults to `1883`
MQTT_PUB_TOPIC | string | No | MQTT publish topic, defaults to `home/TheengsGateway/BTtoMQTT`
MQTT_SUB_TOPIC | string | No | MQTT subscribe topic, defaults to `home/TheengsGateway/commands`
PUBLISH_ALL | boolean | No | Publish all beacons if true, defaults to `yes`
SCAN_DUR | int | No | BLE scan duration (seconds), defaults to `60`
TIME_BETWEEN | int | No | Seconds to wait between scans, defaults to `60`
LOG_LEVEL | string | No | TheengsGateway log level, defaults to `WARNING`
DISCOVERY | boolean | No | Activate discovery or not `true`
DISCOVERY_TOPIC | string | No | Home Assistant discovery topic`homeassistant/sensor`
DISCOVERY_DEVICE_NAME | string | No | Device name `TheengsGateway`
DISCOVERY_FILTER | string | No | Excluded BLE devices models `[IBEACON,GAEN,MS-CDP]`
ADAPTER | string | No | Bluetooth adapter (e.g. hci1 on Linux)
SCANNING_MODE | string | No | Change scanning mode between `active` and `passive`, defaults to `active`

For more details please refer to [TheengsGateway](https://theengs.github.io/gateway/).