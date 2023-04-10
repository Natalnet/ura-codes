import { Router } from 'express'

const router = Router()

router.get('/', (request, response) => {
    request.send('main')
    response.json({SERVER: 'online'})
});

export default router;