import requests


class Py3status:

    def _get_barrier_state_by_exchange(self, data):
        (exchange, host, port) = data.split(':')
        rq = requests.get('http://{}:{}/barrier'.format(host, port))
        if rq.status_code == 200:
            exchanges = rq.json()
            state = filter(
                lambda x: x['name'] == exchange, exchanges['exchanges']
            )[0]
            return 'UP' if state['state'] else 'DOWN'
        else:
            return "ERR"

    def barrier(self):
        state = self._get_barrier_state_by_exchange(self.data)
        response = {
            'full_text': self.py3.safe_format(
                self.format, dict(state=state)
            ),
            'cache_until': self.py3.time_in(300)
        }
        return response        

if __name__ == '__main__':
  P3 = Py3status()
  #P3.data = "mopub:10.1.2.10:5000"
  print P3._get_barrier_state_by_exchange("mopub:10.1.2.10:5000")
