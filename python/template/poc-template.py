import argparse
import urllib3

import requests

banner = """
   _____       _            ____        ___  
  / ____|     | |          |___ \      / _ \ 
 | (___  _   _| |__ _______  __) |_ __| | | |
  \___ \| | | | '_ \_  / _ \|__ <| '__| | | |
  ____) | |_| | |_) / /  __/___) | |  | |_| |
 |_____/ \__,_|_.__/___\___|____/|_|   \___/ 
                                                                                 
        filename.py
        (*) {DATE}: {DESC}

          - https://github.dev/SubZe3r0 (@Subze3r0) 

        CVEs: TBD  
"""


if __name__ == "__main__":
    
    print(banner)
    parser = argparse.ArgumentParser()
    urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)