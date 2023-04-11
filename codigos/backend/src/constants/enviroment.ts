import * as dotenv from 'dotenv'

dotenv.config();

export const enviroment = {

    SERVER: {

        PORT: process.env.API_PORT || 5555,
        NAME: process.env.SERVER_NAME || "ura-backend",
        VERSION: process.env.SERVER_VERSION || "1.0.0"

    },

    REDIS: {
        
        URL: process.env.REDIS_URL || "redis://redis-management:6379",
    },

    MQTT: {
        
        HOSTNAME: process.env.MQTT_HOSTNAME || "10.6.1.42",
        PORT: process.env.MQTT_PORT || 1884
    }
}