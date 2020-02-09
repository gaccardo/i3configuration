import subprocess


class Py3status:

    def docker(self):
        output = subprocess.Popen(
                ['docker', 'ps'],
                stdout=subprocess.PIPE,
                stderr=subprocess.STDOUT
        )
        stdout, stderr = output.communicate()
        count = str(stdout).count("\\n")
        return {
            'full_text': f'C: {count}',
            'cached_until': self.py3.time_in(300)
        }


if __name__ == "__main__":
    py = Py3status()
    print(py.docker())
