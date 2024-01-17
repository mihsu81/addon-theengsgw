#!/usr/bin/env bashio
set -e

CONFIG="/root/theengsgw.conf"

bashio::log.info "Creating TheengsGateway configuration..."

# Create TheengsGateway config
MQTT_HOST=$(bashio::config 'MQTT_HOST')
MQTT_USERNAME=$(bashio::config 'MQTT_USERNAME')
MQTT_PASSWORD=$(bashio::config 'MQTT_PASSWORD')
MQTT_PORT=$(bashio::config 'MQTT_PORT')
MQTT_PUB_TOPIC=$(bashio::config 'MQTT_PUB_TOPIC')
MQTT_SUB_TOPIC=$(bashio::config 'MQTT_SUB_TOPIC')
MQTT_PRE_TOPIC=$(bashio::config 'MQTT_PRE_TOPIC')
PRESENCE=$(bashio::config 'PRESENCE')
PUBLISH_ALL=$(bashio::config 'PUBLISH_ALL')
PUBLISH_ADVDATA=$(bashio::config 'PUBLISH_ADVDATA')
SCAN_DUR=$(bashio::config 'SCAN_DUR')
TIME_BETWEEN=$(bashio::config 'TIME_BETWEEN')
TRACKER_TIMEOUT=$(bashio::config 'TRACKER_TIMEOUT')
LOG_LEVEL=$(bashio::config 'LOG_LEVEL')
DISCOVERY=$(bashio::config 'DISCOVERY')
DISCOVERY_TOPIC=$(bashio::config 'DISCOVERY_TOPIC')
DISCOVERY_DEVICE_NAME=$(bashio::config 'DISCOVERY_DEVICE_NAME')
DISCOVERY_FILTER=$(bashio::config 'DISCOVERY_FILTER')
ADAPTER=$(bashio::config 'ADAPTER')
TIME_SYNC=$(bashio::config 'TIME_SYNC')
TIME_FORMAT=$(bashio::config 'TIME_FORMAT')
IDENTITIES=$(bashio::config 'IDENTITIES')
BINDKEYS=$(bashio::config 'BINDKEYS')
ENABLE_TLS=$(bashio::config 'ENABLE_TLS')
ENABLE_WEBSOCKET=$(bashio::config 'ENABLE_WEBSOCKET')
BLE=$(bashio::config 'BLE')

# Convert the booleans to integers (1 for true, 0 for false) in single lines
BLE=$( [ "$BLE" = "true" ] && echo 1 || echo 0 )
PRESENCE=$( [ "$PRESENCE" = "true" ] && echo 1 || echo 0 )
PUBLISH_ALL=$( [ "$PUBLISH_ALL" = "true" ] && echo 1 || echo 0 )
PUBLISH_ADVDATA=$( [ "$PUBLISH_ADVDATA" = "true" ] && echo 1 || echo 0 )
DISCOVERY=$( [ "$DISCOVERY" = "true" ] && echo 1 || echo 0 )
TIME_FORMAT=$( [ "$TIME_FORMAT" = "true" ] && echo 1 || echo 0 )
ENABLE_TLS=$( [ "$ENABLE_TLS" = "true" ] && echo 1 || echo 0 )
ENABLE_WEBSOCKET=$( [ "$ENABLE_WEBSOCKET" = "true" ] && echo 1 || echo 0 )

bashio::log.info "IDENTITIES: ${IDENTITIES}"
bashio::log.info "BINDKEYS: ${BINDKEYS}"

{
    echo "{"
    echo "    \"host\": \"${MQTT_HOST}\","
    echo "    \"pass\": \"${MQTT_PASSWORD}\","
    echo "    \"user\": \"${MQTT_USERNAME}\","
    echo "    \"port\": ${MQTT_PORT},"
    echo "    \"publish_topic\": \"${MQTT_PUB_TOPIC}\","
    echo "    \"subscribe_topic\": \"${MQTT_SUB_TOPIC}\","
    echo "    \"presence_topic\": \"${MQTT_PRE_TOPIC}\","
    echo "    \"presence\": ${PRESENCE},"
    echo "    \"publish_all\": ${PUBLISH_ALL},"
    echo "    \"publish_advdata\": ${PUBLISH_ADVDATA},"
    echo "    \"ble_scan_time\": ${SCAN_DUR},"
    echo "    \"ble_time_between_scans\": ${TIME_BETWEEN},"
    echo "    \"tracker_timeout\": ${TRACKER_TIMEOUT},"
    echo "    \"log_level\": \"${LOG_LEVEL}\","
    echo "    \"discovery\": \"${DISCOVERY}\","
    echo "    \"discovery_topic\": \"${DISCOVERY_TOPIC}\","
    echo "    \"discovery_device_name\": \"${DISCOVERY_DEVICE_NAME}\","
    echo "    \"discovery_filter\": \"${DISCOVERY_FILTER}\","
    echo "    \"adapter\": \"${ADAPTER}\"",
    echo "    \"time_sync\": ${TIME_SYNC}",
    echo "    \"time_format\": \"${TIME_FORMAT}\"",
    echo "    \"enable_tls\": ${ENABLE_TLS}",
    echo "    \"enable_websocket\": ${ENABLE_WEBSOCKET}",
    echo "    \"ble\": ${BLE}"
    # Check if IDENTITIES is not empty, then include it
    if [ -n "${IDENTITIES}" ]; then
        echo ",    \"identities\": ${IDENTITIES}"
    fi
    # Check if BINDKEYS is not empty, then include it
    if [ -n "${BINDKEYS}" ]; then
        echo ",    \"bindkeys\": ${BINDKEYS}"
    fi
    echo "}"
} > "${CONFIG}"

# Start TheengsGateway
bashio::log.info "Starting TheengsGateway..."
exec /usr/bin/python3 -m TheengsGateway < /dev/null
