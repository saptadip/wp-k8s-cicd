from pathlib import Path
import wpparser
import os	

data_folder = Path("data/latest/")
data_file = data_folder / "blog2-localmac-technotales.WordPress.2020-12-19.xml"

#data = wpparser.parse("./technotales.WordPress.2020-12-19.xml")
blog_data = wpparser.parse(data_file)
title_data = blog_data['posts'][0]['title']
post_name = blog_data['posts'][0]['post_name']
content_data = blog_data['posts'][0]['content']

content_str = content_data.lstrip('\'')
f = open("blog_content.xml", "w")
f.write(content_str)
f.close()
