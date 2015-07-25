''' Conversion script for migrating Library's Docbook XML to Markdown, and
eventually straight into a fixture. Requires pandoc on the system.'''

import os
from subprocess import call

for root, dirs, files in os.walk('src'):
    for file in files:
        if file.endswith(".xml"):
           mdfile = file.replace(".xml", ".md")
           call(["pandoc", "-s", "-f", "docbook", "-t", "markdown", 
           "--template=stflibrary", "-o", os.path.join(root, mdfile), 
           os.path.join(root, file)])

