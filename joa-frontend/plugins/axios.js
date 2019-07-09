import { pick } from 'lodash'
import status from 'http-status'

export default function({ app, store, $axios } ) {
  $axios.onRequest(config => {
  	const headers = store.getters['auth']
  	config.headers = headers
  })

  $axios.onResponse(response => {
    if (response.headers['access-token']) {
      const authHeaders = pick(response.headers, [
        'access-token',
        'client',
        'expiry',
        'uid',
        'token-type'
      ])
      store.commit('auth', authHeaders)

      let session = app.$cookie.get('session')

      // Stores the tokens in a cookie called `session` too. Cookie values are strings, so have to
      // serialize it to JSON.
      //
      // The object we are storing in session looks like this:
      // {'tokens': {'access-token': 'foo', ...}, 'user': {'email': 'foo@bar.com', ...}}
      // so that is why we are extracting and modifying, so that the `user` key isn't blown away.
      if (session) {
        session = JSON.parse(session)
        session.tokens = authHeaders

        app.$cookie.set('session', JSON.stringify(session), { expires: '14D' })
      }
    }
  })

  $axios.onError(error => {
	const router = $nuxt._router
	if(error.response.status === status.UNAUTHORIZED) {
		router.push({ name: 'login' })
	}
  })
}
