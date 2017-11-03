import os,sys

ifile = open("octanol.pdb","r")
reader = ifile.readlines()
ofile = open("test.pdb","w") # temporary file

counter = 0
for line in reader:
    splitter = line.split()
    if splitter[0]=="MODEL" or splitter[0]=="COMPND" or splitter[1]=="AUTHOR":
        ofile.write(line)
    elif splitter[0]=="HETATM":
        heatm = splitter[0]
        numb  = int(splitter[1] )
        atom  = splitter[2] 
        res   = "OCT"
        seq   = int(splitter[4])
        xx    = float(splitter[5])
        yy    = float(splitter[6])
        zz    = float(splitter[7])
        occ   = float(splitter[8])
        
        string_line = "{:6s}{:5d}  {:^4s}{:3s} {:4d}   {:8.3f}{:8.3f}{:8.3f}{:6.2f}          \n".format(heatm,numb,atom,res,seq,xx,yy,zz,occ)
        ofile.write(string_line)	
        counter+=1  # bit of hard coding but I know how many lines I have
    elif counter==27:
        break
    else:
        continue


#now remove the octanol.pdb
cmd = "rm octanol.pdb"
os.system(cmd)
##rename the test.pdb
cmd = "mv test.pdb octanol.pdb"
os.system(cmd)
