import subprocess
import json
import os
import datetime


output = subprocess.Popen(["fluxbench-cli","getbenchmarks"], stdout=subprocess.PIPE)
output2 = output.communicate()
output = json.loads(output2[0])

if output['error'] != '':
        file_object = open('node_failsafe.log', 'a')
        file_object.write(str(datetime.datetime.now()))
        file_object.write(str(':'))
        file_object.write(output['error'])
        file_object.close()
        os.system('sudo shutdown -r now')
