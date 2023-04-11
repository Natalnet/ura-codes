import * as redisPool from 'redis-connection-pool'

export interface RedisInterface {

    initialize(): Promise<void>;

    destroy(): Promise<void>;

    remove(key: string): Promise<any>;

    setCache(key: string, value: string, time: number): Promise<any>;
    getCache(key: string): Promise<any>;

    getKeys(): Promise<any>;

    rpush(key: string, data: any): Promise<any>;
    lrange(key: string, start: number, end: number): Promise<any>;
}