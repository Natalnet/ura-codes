import redisPoolFactory, { RedisConnectionPool } from 'redis-connection-pool'
import { RedisInterface } from '../@types/redis.types'

class RedisService implements RedisInterface {

    async initialize(): Promise<void> {
        
        if (global.redisPool) {
            return;
        }

        const pool = await redisPoolFactory('news-api-redis', {
            max_clients: 10,

            redis: {
                url: process.env.REDIS_URL
            }
        });

        await pool.init();

        global.redisPool = pool;

        console.log('Conexão realizada com sucesso.')
    }

    async getPool(): Promise<RedisConnectionPool> {
        return global.redisPool
    }
    
    async add(key: string, field: string, data: any): Promise<any> {
        return (await this.getPool()).hset(key, field, data);
    }

    async remove(key: string): Promise<any> {
        throw (await this.getPool()).del(key);
    }

    async setCache(key: string, value: string, time: number): Promise<any> {
        return (await this.getPool()).set(key, value, time); //Mudar isso aqui depois
    }

    async getCache(key: string): Promise<any> {
        return (await this.getPool()).get(key);
    }

    async getKeys(): Promise<any> {
        return (await this.getPool()).sendCommand('keys', ['*'])
    }

    async rpush(key: string, data: any): Promise<any> {
        return (await this.getPool()).rpush(key, data);
    }

    async lrange(key: string, start: number, end: number): Promise<any> {
        return (await this.getPool()).sendCommand('lrange', [key, String(start), String(end)]);
    }
}

export default RedisService