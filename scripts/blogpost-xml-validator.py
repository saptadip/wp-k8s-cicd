import wpparser
from pathlib import Path
from os.path import isfile, join
from os import listdir
import sys

def getInputFile():
    data_folder = Path("data/latest/")
    xml_file_list = [f for f in listdir(data_folder) if isfile(join(data_folder, f))]

    if len(xml_file_list) != 1:
      sys.exit("ONE and only ONE xml File is expected in the data/landing direcotry. Exitting...")
    else:
      data_file = data_folder / str(xml_file_list[0])
      parseInputFile(data_file)


def parseInputFile(input_file):
    blog_data = wpparser.parse(input_file)
    blog_title = blog_data['posts'][0]['title']
    blog_post_name = blog_data['posts'][0]['post_name']
    blog_content = blog_data['posts'][0]['content']

    content_str = blog_content.lstrip('\'')
    f = open("blog_content.xml", "w")
    f.write(content_str)
    f.close()


getInputFile()
