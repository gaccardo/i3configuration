import os
import subprocess


class Py3status:

    def kn(self):
        out = subprocess.check_output(
            [
                'kubectl',
                'config',
                'view',
                '--minify',
                '--output',
                'jsonpath={..namespace}'
            ]
        )

        return {
            'full_text': str(out),
            'cached_until': self.py3.time_in(5)
        }
