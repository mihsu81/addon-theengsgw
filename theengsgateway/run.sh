#!/usr/bin/env bashio
set -e

CONFIG="/root/theengsgw.conf"

bashio::log.info "Creating TheengsGateway configuration..."

# Create TheengsGateway config
if bashio::services.available "mqtt"; then
    MQTT_HOST=$(bashio::services "mqtt" "host")
    MQTT_PASSWORD=$(bashio::services "mqtt" "password")
    MQTT_PORT=$(bashio::services "mqtt" "port")
    MQTT_USERNAME=$(bashio::services "mqtt" "username")
else
    bashio::log.info "The MQTT Add-on is not available."
    bashio::log.info "This is not a problem if you are using an external MQTT broker."
    bashio::log.info "If you are using the Home Assistant Mosquitto Broker Add-on, try restarting it, and then restart this addon."
    bashio::log.info "For an external broker, make sure you fill in the mqtt connection settings, and restart the addon."
    MQTT_HOST=$(bashio::config 'MQTT_HOST')
    MQTT_USERNAME=$(bashio::config 'MQTT_USERNAME')
    MQTT_PASSWORD=$(bashio::config 'MQTT_PASSWORD')
    MQTT_PORT=$(bashio::config 'MQTT_PORT')
fi

MQTT_PUB_TOPIC=$(bashio::config 'MQTT_PUB_TOPIC')
MQTT_SUB_TOPIC=$(bashio::config 'MQTT_SUB_TOPIC')
MQTT_PRE_TOPIC=$(bashio::config 'MQTT_PRE_TOPIC')
PRESENCE=$(bashio::config 'PRESENCE')
GENERAL_PRESENCE=$(bashio::config 'GENERAL_PRESENCE')
PUBLISH_ALL=$(bashio::config 'PUBLISH_ALL')
PUBLISH_ADVDATA=$(bashio::config 'PUBLISH_ADVDATA')
BLE=$(bashio::config 'BLE')
SCAN_DUR=$(bashio::config 'SCAN_DUR')
TIME_BETWEEN=$(bashio::config 'TIME_BETWEEN')
TRACKER_TIMEOUT=$(bashio::config 'TRACKER_TIMEOUT')
LOG_LEVEL=$(bashio::config 'LOG_LEVEL')
LWT_TOPIC=$(bashio::config 'LWT_TOPIC')
DISCOVERY=$(bashio::config 'DISCOVERY')
DISCOVERY_TOPIC=$(bashio::config 'DISCOVERY_TOPIC')
DISCOVERY_DEVICE_NAME=$(bashio::config 'DISCOVERY_DEVICE_NAME')
DISCOVERY_FILTER=$(bashio::config 'DISCOVERY_FILTER')
HASS_DISCOVERY=$(bashio::config 'HASS_DISCOVERY')
ADAPTER=$(bashio::config 'ADAPTER')
TIME_SYNC=$(bashio::config 'TIME_SYNC')
TIME_FORMAT=$(bashio::config 'TIME_FORMAT')
IDENTITIES=$(bashio::config 'IDENTITIES')
BINDKEYS=$(bashio::config 'BINDKEYS')
BLACKLIST=$(bashio::config 'BLACKLIST')
WHITELIST=$(bashio::config 'WHITELIST')
TLS_INSECURE=$(bashio::config 'TLS_INSECURE')
ENABLE_TLS=$(bashio::config 'ENABLE_TLS')
ENABLE_WEBSOCKET=$(bashio::config 'ENABLE_WEBSOCKET')

# Convert the booleans to integers (1 for true, 0 for false) in single lines
BLE=$( [ "$BLE" = "true" ] && echo 1 || echo 0 )
PRESENCE=$( [ "$PRESENCE" = "true" ] && echo 1 || echo 0 )
GENERAL_PRESENCE=$( [ "$GENERAL_PRESENCE" = "true" ] && echo 1 || echo 0 )
PUBLISH_ALL=$( [ "$PUBLISH_ALL" = "true" ] && echo 1 || echo 0 )
PUBLISH_ADVDATA=$( [ "$PUBLISH_ADVDATA" = "true" ] && echo 1 || echo 0 )
DISCOVERY=$( [ "$DISCOVERY" = "true" ] && echo 1 || echo 0 )
HASS_DISCOVERY=$( [ "$HASS_DISCOVERY" = "true" ] && echo 1 || echo 0 )
TIME_FORMAT=$( [ "$TIME_FORMAT" = "true" ] && echo 1 || echo 0 )
TLS_INSECURE=$( [ "$TLS_INSECURE" = "false" ] && echo 1 || echo 0 )
ENABLE_TLS=$( [ "$ENABLE_TLS" = "true" ] && echo 1 || echo 0 )
ENABLE_WEBSOCKET=$( [ "$ENABLE_WEBSOCKET" = "true" ] && echo 1 || echo 0 )

bashio::log.info "IDENTITIES: ${IDENTITIES}"
bashio::log.info "BINDKEYS: ${BINDKEYS}"
bashio::log.info "BLACKLIST: ${BLACKLIST}"
bashio::log.info "WHITELIST: ${WHITELIST}"

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
    echo "    \"general_presence\": ${GENERAL_PRESENCE},"
    echo "    \"publish_all\": ${PUBLISH_ALL},"
    echo "    \"publish_advdata\": ${PUBLISH_ADVDATA},"
    echo "    \"ble\": ${BLE}",
    echo "    \"ble_scan_time\": ${SCAN_DUR},"
    echo "    \"ble_time_between_scans\": ${TIME_BETWEEN},"
    echo "    \"tracker_timeout\": ${TRACKER_TIMEOUT},"
    echo "    \"log_level\": \"${LOG_LEVEL}\","
    echo "    \"lwt_topic\": \"${LWT_TOPIC}\","
    echo "    \"discovery\": \"${DISCOVERY}\","
    echo "    \"hass_discovery\": \"${HASS_DISCOVERY}\","
    echo "    \"discovery_topic\": \"${DISCOVERY_TOPIC}\","
    echo "    \"discovery_device_name\": \"${DISCOVERY_DEVICE_NAME}\","
    echo "    \"discovery_filter\": \"${DISCOVERY_FILTER}\","
    echo "    \"adapter\": \"${ADAPTER}\"",
    echo "    \"time_sync\": ${TIME_SYNC}",
    echo "    \"time_format\": \"${TIME_FORMAT}\"",
    echo "    \"tls_insecure\": ${TLS_INSECURE}",
    echo "    \"enable_tls\": ${ENABLE_TLS}",
    echo "    \"enable_websocket\": ${ENABLE_WEBSOCKET}"
    # Check if IDENTITIES is not empty, then include it
    if [ -n "${IDENTITIES}" ]; then
        echo ",    \"identities\": ${IDENTITIES}"
    fi
    # Check if BINDKEYS is not empty, then include it
    if [ -n "${BINDKEYS}" ]; then
        echo ",    \"bindkeys\": ${BINDKEYS}"
    fi
    # Check if BLACKLIST is not empty, then include it
    if [ -n "${BLACKLIST}" ]; then
        echo ",    \"blacklist\": ${BLACKLIST}"
    fi
    # Check if WHITELIST is not empty, then include it
    if [ -n "${WHITELIST}" ]; then
        echo ",    \"whitelist\": ${WHITELIST}"
    fi
    echo "}"
} > "${CONFIG}"

# Start TheengsGateway
bashio::log.info "Starting TheengsGateway..."
exec /usr/bin/python3 -m TheengsGateway < /dev/null
