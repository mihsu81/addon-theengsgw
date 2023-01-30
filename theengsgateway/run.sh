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
PUBLISH_ALL=$(bashio::config 'PUBLISH_ALL')
SCAN_DUR=$(bashio::config 'SCAN_DUR')
TIME_BETWEEN=$(bashio::config 'TIME_BETWEEN')
LOG_LEVEL=$(bashio::config 'LOG_LEVEL')
DISCOVERY=$(bashio::config 'DISCOVERY')
DISCOVERY_TOPIC=$(bashio::config 'DISCOVERY_TOPIC')
DISCOVERY_DEVICE_NAME=$(bashio::config 'DISCOVERY_DEVICE_NAME')
DISCOVERY_FILTER=$(bashio::config 'DISCOVERY_FILTER')
ADAPTER=$(bashio::config 'ADAPTER')
TIME_SYNC=$(bashio::config 'TIME_SYNC')
TIME_FORMAT=$(bashio::config 'TIME_FORMAT')

{
    echo "{"
    echo "    \"host\": \"${MQTT_HOST}\","
    echo "    \"pass\": \"${MQTT_PASSWORD}\","
    echo "    \"user\": \"${MQTT_USERNAME}\","
    echo "    \"port\": ${MQTT_PORT},"
    echo "    \"publish_topic\": \"${MQTT_PUB_TOPIC}\","
    echo "    \"subscribe_topic\": \"${MQTT_SUB_TOPIC}\","
    echo "    \"publish_all\": ${PUBLISH_ALL},"
    echo "    \"ble_scan_time\": ${SCAN_DUR},"
    echo "    \"ble_time_between_scans\": ${TIME_BETWEEN},"
    echo "    \"log_level\": \"${LOG_LEVEL}\","
    echo "    \"discovery\": \"${DISCOVERY}\","
    echo "    \"discovery_topic\": \"${DISCOVERY_TOPIC}\","
    echo "    \"discovery_device_name\": \"${DISCOVERY_DEVICE_NAME}\","
    echo "    \"discovery_filter\": \"${DISCOVERY_FILTER}\","
    echo "    \"adapter\": \"${ADAPTER}\"",
    echo "    \"time_sync\": \"${TIME_SYNC}\"",
    echo "    \"time_format\": \"${TIME_FORMAT}\"",
    echo "}"
} > "${CONFIG}"

# Start TheengsGateway
bashio::log.info "Starting TheengsGateway..."
exec /usr/bin/python3 -m TheengsGateway < /dev/null
