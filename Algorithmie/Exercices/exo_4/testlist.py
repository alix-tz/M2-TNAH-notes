prenom=['a', 'b', 'c', 'd', 'e']
entre=input("le prénom recherché : ")
ok=False
for i in range (0,5):
    if(prenom[i]==entre):
        print("le prénom est bien dans le tableau")
        ok=True
if(ok==False):
    print("le prénom se trouve pas dans le tableau")
