import cx_Oracle, matplotlib.pyplot as plt, numpy as np
from pandas import Series, DataFrame
import sys
import pytagcloud
from collections import Counter

con = cx_Oracle.connect("scott/tiger@127.0.0.1:1521/xe")
list = []
email = sys.argv[1]
# email = "a@a.bc"
try:
    cursor = con.cursor()
    cursor.execute("select hashName from review1 r, HASHTAG1 h where email='"+email+"' and (r.hashnum1 = h.hashNum or r.hashnum3 = h.hashNum or r.hashnum2 = h.hashNum)")
    data = cursor.fetchall()
    for imsi in data:
        list.append(imsi)
except:
    print('exception:', sys.exc_info())
finally:
    con.close()
    df = DataFrame(list, columns=['HASHNAME'])

nouns = df.HASHNAME
count=Counter(nouns)
tag2 = count.most_common(10)
taglist = pytagcloud.make_tags(tag2, maxsize=50) # maxsize 글자크기
pytagcloud.create_tag_image(taglist, 'C:/spring/springSrc/finalproject/src/main/webapp/image/'+email+'Wordcloud.png', size=(700, 300), fontname='korean', rectangular=True)
