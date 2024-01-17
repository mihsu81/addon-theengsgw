# Installation and Configuration

1. Open Home Assistant and navigate to the "Add-on Store". Click on the 3 dots (top right) and select "Repositories".
2. Enter `https://github.com/mihsu81/addon-theengsgw` in the box and click on "Add".
3. You should now see "TheengsGateway HA Add-on" at the bottom list.
4. Click on "TheengsGateway", then click "Install".
5. Under the "Configuration" tab, change the settings appropriately (at least MQTT parameters), see [Parameters](#parameters).
6. Start the Add-on.

## Parameters

| Option                | Type    | Required | Description                                                                     |
| --------------------- | ------- | -------- | ------------------------------------------------------------------------------- |
| MQTT_HOST             | string  | Yes      | MQTT host address, i.e. the IP/hostname of your Moquitto Broker Add-on          |
| MQTT_USERNAME         | string  | Yes      | MQTT username                                                                   |
| MQTT_PASSWORD         | string  | Yes      | MQTT password                                                                   |
| MQTT_PORT             | integer | Yes      | MQTT host port, defaults to `1883`                                              |
| MQTT_PUB_TOPIC        | string  | No       | MQTT publish topic, defaults to `home/TheengsGateway/BTtoMQTT`                  |
| MQTT_SUB_TOPIC        | string  | No       | MQTT subscribe topic, defaults to `home/+/BTtoMQTT/undecoded`                   |
| PRESENCE              | boolean | No       | Publish room presence detection, defaults to `no`                               |
| MQTT_PRE_TOPIC        | string  | No       | MQTT presence topic, defaults to `home/presence/TheengsGateway`                 |
| PUBLISH_ALL           | boolean | No       | Publish all beacons if true, defaults to `yes`                                  |
| PUBLISH_ADVDATA       | boolean | No       | Publish advertisements data if true, defaults to `no`                           |
| SCAN_DUR              | int     | No       | BLE scan duration (seconds), defaults to `60`                                   |
| TIME_BETWEEN          | int     | No       | Seconds to wait between scans, defaults to `60`                                 |
| TRACKER_TIMEOUT       | int     | No       | Seconds before a tracker is declared as offline `120`                           |
| LOG_LEVEL             | string  | No       | TheengsGateway log level, defaults to `WARNING`                                 |
| DISCOVERY             | boolean | No       | Activate discovery or not `true`                                                |
| DISCOVERY_TOPIC       | string  | No       | Home Assistant discovery topic`homeassistant`                                   |
| DISCOVERY_DEVICE_NAME | string  | No       | Device name `TheengsGateway`                                                    |
| DISCOVERY_FILTER      | string  | No       | Excluded BLE devices models `[IBEACON,GAEN,MS-CDP,APPLE_CONT]`                  |
| ADAPTER               | string  | No       | Bluetooth adapter (e.g. hci1 on Linux)                                          |
| SCANNING_MODE         | string  | No       | Change scanning mode between `active` and `passive`, defaults to `active`       |
| TIME_SYNC             | string  | No       | Addresses of BLE devices to synchronize time (defaults to the empty list `[]`)  |
| TIME_FORMAT           | boolean | No       | Use 12-hour (`yes`) or 24-hour (`no`) time format for clocks (defaults to `no`) |
| IDENTITIES            | json    | No       | IRK to resolve private addresses, example { "00:11:22:33:44:55:66":"0dc540f3025b474b9ef1085e051b1add","AA:BB:CC:DD:EE:FF":"6385424e1b0341109942ad2a6bb42e58"}              |
| BINDKEYS              | json    | No       | Addresses and key to decrypt data, example { "00:11:22:33:44:55:66":"0dc540f3025b474b9ef1085e051b1add","AA:BB:CC:DD:EE:FF":"6385424e1b0341109942ad2a6bb42e58"}              |
| ENABLE_TLS            | boolean | No       | Activate TLS                                                                    |
| ENABLE_WEBSOCKET      | boolean | No       | Activate WebSocket                                                              |
| BLE                   | boolean | No       | Enable Bluetooth usage                                                          |

For more details please refer to [TheengsGateway](https://theengs.github.io/gateway/).
