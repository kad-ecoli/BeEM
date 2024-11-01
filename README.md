# BeEM: Conversion of PDBx/mmCIF Files to Best Effort/Minimal Format PDB Files #

The current official format for the Protein Data Bank is [PDBx/mmCIF](https://mmcif.wwpdb.org/). However, there are many structural bioinformatics tools that accepts the legacy [PDB](http://www.wwpdb.org/documentation/file-format-content/format33/v3.3.html) format rather than PDBx/mmCIF format. Some mmCIF structures cannot converted to PDB format, including:

* Entries containing multiple character chain ids
* Entries containing > 62 chains
* Entries containing > 99999 ATOM coordinates
* Entries that have complex beta sheet topology

For these structures, the [Best Effort/Minimal](https://www.rcsb.org/docs/general-help/structures-without-legacy-pdb-format-files) PDB files are provided by the PDB database instead. Unfortunately, [not](https://www.rcsb.org/structure/7NWG) [all](https://www.rcsb.org/structure/7NWH) [best](https://www.rcsb.org/structure/7NWI) effort/minimal files are generated correctly in the PDB database. Moreover, there is no publicly available tool for the generation of Best Effort/Minimal files. To address this issue, we develop BEst Effort/Minimal (BeEM), the first open source implementation for the generation of Best Effort/Minimal file.

## Usage ##
Although binary executables are available for 
[Linux](https://github.com/kad-ecoli/BeEM/releases/download/v1.0.1/BeEM.linux), 
[Windows](https://github.com/kad-ecoli/BeEM/releases/download/v1.0.1/BeEM.windows.exe) and
[Mac](https://github.com/kad-ecoli/BeEM/releases/download/v1.0.1/BeEM.macosx), 
it is recommended to compile the C++ program on your own operating system:
```bash
g++ -O3 BeEM.cpp -o BeEM
```
Example usage:
```bash
BeEM example_input/3j6b.cif
```
Output files should be identical to those in ``example_output/3j6b-*``.
On Linux, Mac and Windows Subsystem for Linux, BeEM read input files with and without gzip compression.

## Limitations ##
Best effort/minimal PDB format files contain only authorship, citation details and coordinate data under HEADER, AUTHOR, JRNL, CRYST1, SCALEn, ATOM, HETATM records.

The following PDB records are not included: OBSLTE, TITLE, CAVEAT, COMPND, SOURCE, KEYWDS, EXPDTA, REVDAT, SPRSDE, REMARKS, DBREF, SEQADV, SEQRES, MODRES, HET, HETNAM, HETSYN, FORMUL, HELIX, SHEET, SSBOND, LINK, CISPEP, SITE, ORIGXn, MTRIXn, CONECT.

BeEM may optionally include SEQRES and DBREF.

[Extended length CCD names (i.e., residue names with 5 characters)](https://www.rcsb.org/news/630fee4cebdf34532a949c34)
will be mapped to a set of reserved CCD IDs: 01 - 99, DRG, INH, LIG that will never be used in the PDB.
In this case, a tab-delimited mapping file ligand-id-mapping.tsv will be provided to map reserved CCD IDs to extended length CCD IDs.

For residue sequence number with 5 or more characters, the first four characters occupies usual location for the residue sequence number, the fifth character will occupy the position of the insertion code, while the remaining charaters are discarded. A single [chain with >99999 atoms](https://www.rcsb.org/structure/4V5X) are splitted into multiple Best Effort/Minimal files.

## CIFTE ##
Another program, ``cifte`` is available to perform the reverse operation of converting PDB format files to mmCIF/PDBx format.
```bash
g++ -O3 cifte.cpp -o cifte
cifte input.pdb output.cif
```

## Citation ##
Chengxin Zhang (2023)
[BeEM: fast and faithful conversion of mmCIF format structure files to PDB format](https://doi.org/10.1186/s12859-023-05388-9).
BMC Bionformatics, 24, 260.
