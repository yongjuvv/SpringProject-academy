import cx_Oracle,sys, matplotlib.pyplot as plt, numpy as np
from pandas import Series, DataFrame
import sys
con = cx_Oracle.connect("scott/tiger@127.0.0.1:1521/xe")
email = sys.argv[1]
#email = 'a@a.bc'
list2 = []
high=""
try:
    cursor = con.cursor()
    for imsi in range(1,11):
        cursor.execute("select "+str(imsi)+", count(reviewrate) from review1 where email='"+email+"' and reviewrate ="+ str(imsi) )
        data = cursor.fetchall()
        for imsi2 in data:
            list2.append(imsi2)
    cursor.execute("select max(count(reviewrate)) from review1 where email = '"+email+"' group by reviewrate")
    data2 = cursor.fetchone()
    #for imsi3 in data2:
    high = data2

        #list2.append(data)
except:
    print('exception:', sys.exc_info())
finally:
    con.close()
    #df = DataFrame(list, columns=['RATE','COUNT'])
    df = DataFrame(list2,columns=['RATE','COUNT'])
    high =high[0]



plt.figure()
#plt.bar(df.index, df['COUNT'],width=0.9, color='#ffd700')
i='1'
for imsi4 in list2:
    i = str(i)
    if(imsi4[1:][0]==int(high)):
        plt.bar(i, imsi4[1:], width=0.95, color="#f89b00")
    else:
        plt.bar(i, imsi4[1:], width=0.95, color="#ffd700")
    i = int(i)+1

#plt.xticks(range(0,len(df.index),1),df['ename'], rotation='vertical')
#plt.axis('off')
plt.subplots_adjust(left = 0, bottom = 0.6, right = 1, top = 1, hspace = 0, wspace = 0)
plt.xticks(range(1,len(df.index),2),df['RATE'] ,rotation='horizontal', color='gray')
plt.yticks([],[])
ax = plt.gca()
ax.spines['right'].set_color('none')
ax.spines['top'].set_color('none')
ax.spines['left'].set_color('none')
ax.spines['bottom'].set_color('none')
ax.tick_params(bottom='off')
fig = plt.gcf() #변경한 곳
#plt.show()
fig.savefig('C:/spring/springSrc/finalproject/src/main/webapp/image/'+email+'RateGraph.png',bbox_inches='tight', pad_inches = 0)