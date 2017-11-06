from parmed.amber import * 
import parmed

base = AmberParm("octanol.prmtop","octanol.rst7")

parmed.tools.writeOFF(base,"octanol.off").execute()
parmed.tools.writeFrcmod(base,"octanol.frcmod").execute()
